# HiPMMCode v1.3.0

The fullscreen terminal picks up the panels and session tools that were missing from the previous cut. Open them from the slash menu instead of leaving the screen.

- **Session tools.** Resume, rewind, import, and export stay inside the TUI. A restart returns to the same session.
- **Review and settings.** Code review, the diff, model, effort, theme, hooks, memory, and permissions each have their own panel.
- **Agents.** The footer lists teammates, and the agent tree shows who is working.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Check downloads against `SHA256SUMS`. Tag: `v1.3.0`. Desktop builds stay on their own version line. Do not mark `desktop-v*` as GitHub Latest. The 16-file upload set is `dist/upload-v1.3.0/`. GitHub Latest stays v1.2.3 until this release is published.

# HiPMMCode v1.2.3

On Windows, Ctrl+V pastes a copied picture. Drag-select copies the text, and Ctrl+V pastes that selection. A PowerShell script that contains Chinese is no longer read as the wrong encoding.

- **One Ctrl+V for pictures and text.** In PowerShell or Windows Terminal, a picture clipboard inserts `[Image #N]`. A text-only clipboard still pastes text.
- **Drag to copy.** Drag across the transcript and release. The bottom bar reports the copy, and Ctrl+V pastes that text.
- **Chinese PowerShell scripts.** A `.ps1` that contains Chinese is saved as UTF-8 with a BOM. Windows PowerShell 5.1 reads it as Unicode.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed, notarization accepted, standalone binary not stapled), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Check downloads against `SHA256SUMS`. Tag: `v1.2.3`. Desktop builds stay on their own version line. Do not mark `desktop-v*` as GitHub Latest.

# HiPMMCode v1.2.2

While a reply is being spoken, Pause and Stop stay on the bottom bar. A gray next-line suggestion no longer covers them.

- **Voice controls stay up.** `/voice talk` and `/voice speak` keep `Pause` and `Stop` for the whole playback. The suggestion hint returns after the audio finishes.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed, not notarized this cut), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Check downloads against `SHA256SUMS`. Tag: `v1.2.2`. Desktop builds stay on their own version line. Do not mark `desktop-v*` as GitHub Latest.

# HiPMMCode v1.2.1

AskUserQuestion no longer stacks two `Continuing…` lines or two empty input rows. A Chinese reply no longer leaves one wide character on its own line.

- **One status line.** The 100ms tick redraws the whole frame. It does not stamp `Continuing…` onto a remembered row. The empty hint stays on one row.
- **Chinese wrap.** Assistant text is wrapped once, so `可`, `严`, and `湾，` are not peeled onto a line by themselves. The user bar stops two columns short of the right edge.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed, not notarized this cut), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Check downloads against `SHA256SUMS`. Tag: `v1.2.1`. Desktop builds stay on their own version line. Do not mark `desktop-v*` as GitHub Latest.

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
