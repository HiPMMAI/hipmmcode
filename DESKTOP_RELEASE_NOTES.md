# HiPMMCode Desktop v1.0.7

HiPMMCode Desktop v1.0.7 packages the local HiPMMCode Web workspace together
with compiled `hipmmcode v1.0.5`. Desktop versioning is independent from the
terminal CLI release line.

## Release tag and Latest policy

- Desktop tag: `desktop-v1.0.7`
- Bundled CLI: `v1.0.5`
- GitHub Latest: keep CLI `v1.0.5` as Latest

Do not mark `desktop-v1.0.7` as Latest. The supported terminal installers use
`releases/latest/download/install.sh` and `install.ps1` and must continue to
resolve to the CLI release.

## Exact asset manifest

The Desktop release must contain exactly these eight assets:

```text
aarch64-apple-darwin-HiPMMCode.app.zip
aarch64-apple-darwin-HiPMMCode_1.0.7_aarch64.dmg
x86_64-apple-darwin-HiPMMCode.app.zip
x86_64-apple-darwin-HiPMMCode_1.0.7_x64.dmg
x86_64-pc-windows-msvc-HiPMMCode_1.0.7_x64-setup.exe
x86_64-unknown-linux-gnu-HiPMMCode_1.0.7_amd64.AppImage
x86_64-unknown-linux-gnu-HiPMMCode_1.0.7_amd64.deb
SHA256SUMS
```

The packages are assembled locally under the private build repository at
`dist/upload-desktop-v1.0.7/`. That local directory and all signing material
must never be committed to this public repository; upload the eight files as
GitHub Release assets instead.

## Platform trust status

### macOS

Both Apple Silicon and Intel apps are signed with an Apple Developer ID
Application certificate, notarized by Apple, and stapled. Gatekeeper should
accept a package downloaded from the official release without requiring users
to remove quarantine attributes or add an ad-hoc signature. Bundled Node is
signed with both `allow-jit` and `allow-unsigned-executable-memory`.

### Windows

The Windows application and NSIS installer are intentionally unsigned in this
release. Microsoft Defender SmartScreen may display an unknown-publisher
warning or block the first launch. Download only from the official release and
verify the SHA-256 checksum. Authenticode signing is planned for a later
release.

### Linux

The AppImage and Debian package are unsigned. Download them only from the
official release and verify the SHA-256 checksum. The AppImage may need its
executable bit enabled:

```bash
chmod +x x86_64-unknown-linux-gnu-HiPMMCode_1.0.7_amd64.AppImage
```

## Verify downloads

Download `SHA256SUMS` into the same directory as the selected package and run:

```bash
shasum -a 256 -c SHA256SUMS
```

On Linux, `sha256sum --check SHA256SUMS` is also supported. On Windows,
compare the package's `Get-FileHash -Algorithm SHA256` output with its row in
`SHA256SUMS`.

## Publication checklist

- Create a new release with tag `desktop-v1.0.7`; never reuse or overwrite an
  old tag.
- Upload exactly the eight assets listed above.
- Do not check “Set as the latest release”.
- Confirm GitHub Latest still points at CLI `v1.0.5`.
