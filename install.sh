#!/usr/bin/env bash
# hipmmcode installer — downloads the prebuilt binary for your platform.
#   curl -fsSL https://raw.githubusercontent.com/HiPMMAI/hipmmcode/main/install.sh | bash
#
# Installs into a versioned release directory and atomically flips a
# `current` symlink to it — an interrupted or failed upgrade never leaves a
# half-written binary live, and re-running this script is always safe to
# retry (a concurrency lock guards two installs racing each other).
set -euo pipefail

REPO="${HIPMMCODE_REPO:-HiPMMAI/hipmmcode}"
INSTALL_DIR="${HIPMMCODE_INSTALL_DIR:-$HOME/.local/bin}"
if [ "${HIPMMCODE_PKG_ROOT+x}" = x ]; then
  [ -n "$HIPMMCODE_PKG_ROOT" ] || { echo "HIPMMCODE_PKG_ROOT is set but empty" >&2; exit 1; }
  PKG_ROOT="$HIPMMCODE_PKG_ROOT"
elif [ "${HIPMMCODE_CONFIG_DIR+x}" = x ]; then
  [ -n "$HIPMMCODE_CONFIG_DIR" ] || { echo "HIPMMCODE_CONFIG_DIR is set but empty" >&2; exit 1; }
  PKG_ROOT="$HIPMMCODE_CONFIG_DIR/packages/standalone"
elif [ "${HIPMMCODE_HOME+x}" = x ]; then
  [ -n "$HIPMMCODE_HOME" ] || { echo "HIPMMCODE_HOME is set but empty" >&2; exit 1; }
  PKG_ROOT="$HIPMMCODE_HOME/packages/standalone"
else
  PKG_ROOT="$HOME/.hipmmcode/packages/standalone"
fi
RELEASES_DIR="$PKG_ROOT/releases"
CURRENT_LINK="$PKG_ROOT/current"
LOCK_DIR="$PKG_ROOT/install.lock.d"
LOCK_STALE_SECS=600

os=$(uname -s); arch=$(uname -m)
case "$os" in
  Darwin) label="darwin-universal" ;;
  Linux)
    case "$arch" in
      x86_64)         label="linux-x64" ;;
      aarch64|arm64)  label="linux-arm64" ;;
      *) echo "unsupported arch: $arch" >&2; exit 1 ;;
    esac ;;
  *) echo "unsupported OS: $os (macOS / Linux only)" >&2; exit 1 ;;
esac

mkdir -p "$PKG_ROOT" "$RELEASES_DIR"

# Portable mtime-in-epoch-seconds: BSD/macOS `stat -f %m` vs GNU/Linux
# `stat -c %Y` take AND MEAN completely different `-f` flags (GNU's `-f` is
# "show filesystem status", not a format string) — flag-probing via
# redirected-stderr fallback is unreliable here, so branch on the `$os`
# already detected above instead of guessing.
path_mtime() {
  if [ "$os" = "Darwin" ]; then
    stat -f %m "$1" 2>/dev/null || echo 0
  else
    stat -c %Y "$1" 2>/dev/null || echo 0
  fi
}

# Concurrency lock: `mkdir` is atomic on POSIX, so only one installer wins the
# race. A lock dir older than LOCK_STALE_SECS is assumed to be left behind by
# a crashed/killed prior run and is reclaimed rather than blocking forever.
lock_acquired=0
for _ in 1 2 3; do
  if mkdir "$LOCK_DIR" 2>/dev/null; then
    lock_acquired=1
    break
  fi
  if [ -d "$LOCK_DIR" ]; then
    age=$(( $(date +%s) - $(path_mtime "$LOCK_DIR") ))
    if [ "$age" -gt "$LOCK_STALE_SECS" ]; then
      echo "Reclaiming stale install lock (${age}s old)..." >&2
      rmdir "$LOCK_DIR" 2>/dev/null || true
      continue
    fi
  fi
  echo "Another hipmmcode install appears to be in progress; waiting..." >&2
  sleep 2
done
if [ "$lock_acquired" -ne 1 ]; then
  echo "Could not acquire the install lock at $LOCK_DIR — remove it manually if no install is running." >&2
  exit 1
fi
trap 'rmdir "$LOCK_DIR" 2>/dev/null || true' EXIT

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"; rmdir "$LOCK_DIR" 2>/dev/null || true' EXIT

url="https://github.com/$REPO/releases/latest/download/hipmmcode-$label.tar.gz"
echo "Downloading $url ..."
curl -fsSL "$url" -o "$tmp/hipmmcode.tar.gz"

# Best-effort integrity check against the release's SHA256SUMS. Never fatal
# on its own — an older release, a rate-limited fetch, or no local hash tool
# shouldn't block an otherwise-good install; a MISMATCH is fatal (that means
# the download is corrupt or was tampered with).
sums_url="https://github.com/$REPO/releases/latest/download/SHA256SUMS"
if curl -fsSL "$sums_url" -o "$tmp/SHA256SUMS" 2>/dev/null; then
  expected=$(awk -v f="hipmmcode-$label.tar.gz" '$2 == f || $2 == "*"f {print $1; exit}' "$tmp/SHA256SUMS")
  if [ -n "$expected" ]; then
    if command -v sha256sum >/dev/null 2>&1; then
      actual=$(sha256sum "$tmp/hipmmcode.tar.gz" | awk '{print $1}')
    elif command -v shasum >/dev/null 2>&1; then
      actual=$(shasum -a 256 "$tmp/hipmmcode.tar.gz" | awk '{print $1}')
    elif command -v openssl >/dev/null 2>&1; then
      actual=$(openssl dgst -sha256 "$tmp/hipmmcode.tar.gz" | awk '{print $NF}')
    else
      actual=""
    fi
    if [ -n "$actual" ]; then
      if [ "$actual" != "$expected" ]; then
        echo "SHA256 mismatch for hipmmcode-$label.tar.gz: expected $expected, got $actual" >&2
        exit 1
      fi
      echo "SHA256 verified."
    fi
  fi
fi

tar -xzf "$tmp/hipmmcode.tar.gz" -C "$tmp"

# The exact version comes from the binary itself (not the download URL,
# which is version-agnostic `releases/latest`) — this also self-verifies the
# extracted binary actually runs before it's ever wired up as `current`.
version=$("$tmp/hipmmcode" --version 2>/dev/null | awk '{print $NF}')
if [ -z "$version" ]; then
  echo "Could not determine the downloaded binary's version (hipmmcode --version failed)." >&2
  exit 1
fi

release_dir="$RELEASES_DIR/$version-$label"
mkdir -p "$release_dir"
install -m 755 "$tmp/hipmmcode" "$release_dir/hipmmcode"

# L1 default skills pack lives next to the binary in the release tarball.
# Keep it beside the installed binary so first-launch sync /
# `hipmmcode skill install-defaults` finds `{exe_dir}/default-skills/`.
if [ -d "$tmp/default-skills" ]; then
  rm -rf "$release_dir/default-skills"
  cp -R "$tmp/default-skills" "$release_dir/default-skills"
fi

# macOS Gatekeeper: clear the quarantine bit for a smooth first run.
command -v xattr >/dev/null 2>&1 && xattr -d com.apple.quarantine "$release_dir/hipmmcode" 2>/dev/null || true

# Flip `current` → this release. NOTE: this is intentionally NOT done via
# `ln -sfn tmp_link; mv tmp_link "$CURRENT_LINK"` — when `$CURRENT_LINK`
# already exists as a symlink pointing at a DIRECTORY (exactly our case:
# each release IS a directory), both GNU and BSD `mv` resolve the symlink
# and conclude the destination is a directory, then move the new symlink
# INSIDE it instead of replacing it — silently leaving `current` pointing at
# the OLD release. GNU `mv -T`/`--no-target-directory` avoids this but has
# no BSD/macOS equivalent, so it isn't portable. `ln -sfn` on the final path
# does the right thing on both (its `-n` exists precisely to not-dereference
# an existing symlink target for this decision) — the swap is unlink+symlink
# rather than a single rename(2), so there's a very brief window rather than
# true atomicity, but it's simple, portable, and — unlike the mv approach —
# actually correct.
rm -f "$CURRENT_LINK"
ln -sfn "$release_dir" "$CURRENT_LINK"

mkdir -p "$INSTALL_DIR"
rm -f "$INSTALL_DIR/hipmmcode"
ln -sfn "$CURRENT_LINK/hipmmcode" "$INSTALL_DIR/hipmmcode"

echo "Installed: $INSTALL_DIR/hipmmcode -> $release_dir/hipmmcode (version $version)"
"$INSTALL_DIR/hipmmcode" --version || true

# Keep only the current release + the previous one on disk (instant-rollback
# window) so repeated upgrades don't accumulate unbounded old binaries.
ls -1t "$RELEASES_DIR" 2>/dev/null | tail -n +3 | while IFS= read -r old; do
  rm -rf "${RELEASES_DIR:?}/$old"
done

case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *) echo "NOTE: add to PATH →  export PATH=\"$INSTALL_DIR:\$PATH\"" ;;
esac
# Sync L1 default skills into ~/.hipmmcode/skills (missing-only; safe to re-run).
if [ -d "$release_dir/default-skills" ]; then
  HIPMMCODE_DEFAULT_SKILLS_DIR="$release_dir/default-skills" \
    "$INSTALL_DIR/hipmmcode" skill install-defaults 2>/dev/null \
    || echo "NOTE: run later →  hipmmcode skill install-defaults"
fi

echo "Get started:  hipmmcode model   (configure a channel)   then:  hipmmcode"
