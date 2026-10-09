# HiPMMCode v1.2.0

The fullscreen TUI no longer leaves a frozen second `Continuing…` line. `hipmmcode update` can still find the latest CLI release when the GitHub API does not answer.

- **One status row.** After a question or leaving plan mode moves the spinner, the 100ms tick does not write `Continuing…` on the previous row.
- **Update without the API.** A failed latest-release call follows `releases/latest` and accepts only `vX.Y.Z`. Desktop tags are ignored.

**Platforms:** macOS (Apple Silicon, Intel, and universal), Linux (x64 and arm64, musl static), and Windows (x64). Check downloads against `SHA256SUMS`. Tag: `v1.2.0`. Desktop builds stay on their own version line. The 16-file upload set is `dist/upload-v1.2.0/` after packaging. Do not `gh release` or git push unless asked.

# HiPMMCode v1.1.6

The Grok effort menu matches the Grok client. Windows file tools no longer refuse a path only because of the `\\?\` prefix. The blue status stays up for the whole turn, and a real file path opens on a click.

- **Grok effort.** Unset Grok channels default to `high`. `/effort max` and `ultra` clamp to `xhigh`. The menu is Extended (`xhigh`), Heavy (`high`), Balanced (`medium`), and Faster (`low`).
- **Windows paths.** Read, Write, Edit, notebooks, patches, speech, and video treat `\\?\C:\…` and `C:\…` as the same file. `config.json` stays unreadable. A skill directory is shown without the `\\?\` prefix.
- **Status while generating.** The blue row stays for the whole turn and follows the current step. It no longer disappears after the first sentence.
- **Click a path.** A real file opens on a plain click, including `目录/index.html` in the working directory, Desktop, or Downloads.
- **Errors and the console.** A provider HTTP failure omits the host, IP, and port. Write and Edit settle to a short preview. PowerShell started from a GUI parent does not open a console window. Listing desktop windows does not require the Codex sky transport.

**Platforms:** macOS (Apple Silicon, Intel, and universal), Linux (x64 and arm64, musl static), and Windows (x64). Check downloads against `SHA256SUMS`. Tag: `v1.1.6`. Desktop builds stay on their own version line.

# HiPMMCode v1.1.5

Windows commands go straight to the local shell. Everyday Bash on macOS and Linux no longer waits on a second model check. After a normal turn, the input can show the next line in gray.

- **Windows.** PowerShell is passed to `-Command` as typed. It is no longer wrapped in `[ScriptBlock]::Create`. Auto mode no longer asks `grok-4.7` before every PowerShell command.
- **macOS and Linux.** Everyday commands such as `cargo build` and `git commit` run directly. `rm -rf /`, `curl | sh`, `git reset --hard`, and plan mode still go through the existing safety check.
- **While a reply is streaming.** Tool calls stay where they happened instead of piling up under the text. After the answer is on screen and no tool is running, the bottom row no longer keeps saying `Thinking…`.
- **Grok 4.7.** The context window is 500k. The top reasoning level is shown as `(xhigh)`, not `max`. Membership and the Grok channel use the same four levels: low, medium, high, and xhigh.
- **Prompt suggestions.** After a successful turn, when the input is empty and nothing is queued, hipmmcode predicts the next line and shows it in gray. Tab or Right Arrow accepts it. The request sends no temperature, no output cap, and no reasoning effort.

**Platforms:** macOS (Apple Silicon, Intel, and universal), Linux (x64 and arm64, musl static), and Windows (x64). Check downloads against `SHA256SUMS`. Tag: `v1.1.5`. Desktop builds stay on their own version line.
