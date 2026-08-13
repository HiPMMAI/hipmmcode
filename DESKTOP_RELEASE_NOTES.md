# HiPMMCode Desktop v1.0.1

HiPMMCode Desktop v1.0.1 packages the local HiPMMCode Web workspace together
with compiled `hipmmcode v1.0.0`. Desktop versioning is independent from the
terminal CLI release line.

## Release tag and Latest policy

- Desktop tag: `desktop-v1.0.1`
- Bundled CLI: `v1.0.0`
- GitHub Latest: keep CLI `v1.0.0` as Latest

Do not mark `desktop-v1.0.1` as Latest. The supported terminal installers use
`releases/latest/download/install.sh` and `install.ps1` and must continue to
resolve to the CLI release.

## Exact asset manifest

The Desktop release must contain exactly these eight assets:

```text
aarch64-apple-darwin-HiPMMCode.app.zip
aarch64-apple-darwin-HiPMMCode_1.0.1_aarch64.dmg
x86_64-apple-darwin-HiPMMCode.app.zip
x86_64-apple-darwin-HiPMMCode_1.0.1_x64.dmg
x86_64-pc-windows-msvc-HiPMMCode_1.0.1_x64-setup.exe
x86_64-unknown-linux-gnu-HiPMMCode_1.0.1_amd64.AppImage
x86_64-unknown-linux-gnu-HiPMMCode_1.0.1_amd64.deb
SHA256SUMS
```

The packages are assembled locally under the private build repository at
`dist/upload-desktop-v1.0.1/`. That local directory and all signing material
must never be committed to this public repository; upload the eight files as
GitHub Release assets instead.

## Platform trust status

### macOS

Both Apple Silicon and Intel apps are signed with an Apple Developer ID
Application certificate, notarized by Apple, and stapled. Gatekeeper should
accept a package downloaded from the official release without requiring users
to remove quarantine attributes or add an ad-hoc signature.

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
chmod +x x86_64-unknown-linux-gnu-HiPMMCode_1.0.1_amd64.AppImage
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

- Create a new release with tag `desktop-v1.0.1`; never reuse or overwrite an
  old tag.
- Upload exactly the eight assets listed above.
- Keep the release out of GitHub Latest so CLI install URLs remain valid.
- Download the published assets again and validate them against the published
  `SHA256SUMS` before linking the release from `www.hipmmai.com/downloads`.
- State clearly that Windows and Linux are unsigned; do not describe Windows
  as Authenticode-signed.

---

# HiPMMCode 桌面版 v1.0.1

HiPMMCode Desktop v1.0.1 将本地 Web 工作台与编译后的 `hipmmcode v1.0.0`
一起打包。桌面版本与终端 CLI 版本相互独立。

## 标签与 Latest 规则

- 桌面标签：`desktop-v1.0.1`
- 内置 CLI：`v1.0.0`
- GitHub Latest：继续保留 CLI `v1.0.0`

不要将 `desktop-v1.0.1` 设为 Latest，因为终端安装脚本依赖
`releases/latest/download/install.sh` 和 `install.ps1`。

## 平台状态

- macOS Apple Silicon 与 Intel：Developer ID 签名、Apple 公证并已 staple。
- Windows x64：当前明确未签名，SmartScreen 可能显示未知发布者警告。
- Linux x64：AppImage 与 Debian 包当前未签名。
- 所有平台都必须从官方 release 下载，并按照 `SHA256SUMS` 校验。

发布时新建 `desktop-v1.0.1` Release，上传上方列出的八个文件。发布后重新
下载全部远端资产并复核 SHA-256，全部通过后才能更新
`www.hipmmai.com/downloads` 的下载链接。
