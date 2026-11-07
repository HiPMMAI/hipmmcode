# HiPMMCode v1.3.3

No flicker or leftovers in the fullscreen terminal, Ctrl+Enter sends now, and searches and comparisons in Bash no longer show as failures.

- **Ctrl+Enter is [Send now].** In fullscreen, while a turn runs, Ctrl+Enter sends the composer line now (on an empty composer, the row at the front of the queue), as the [Send now] chip does. It needs a terminal that tells Ctrl+Enter apart (kitty, WezTerm, Ghostty, iTerm2 and others); in macOS Terminal Ctrl+Enter and Enter send the same byte, so press Enter twice. External editors (Ctrl+G, Ctrl+X Ctrl+E, `/editor`) and Ctrl+Z get the plain key encoding, so Esc and Ctrl+X work in nano and vim; `HIPMMCODE_KEYBOARD_PROTOCOL=0` turns it off. Also: clicking the suggested prompt fills the composer instead of sending it, Enter in fullscreen no longer flashes, and streaming redraws only the rows that changed.
- **Fewer red Bash results.** Exit 1 from `grep`/`rg` with no match, `diff` with differences, a false `test`/`[`, or `find` with unreadable directories is no longer a failure: it shows as "No matches found", "Files differ", "Condition is false" and so on (judged by the last command of a pipeline or chain; 2 and up still fail). The tool description also tells the model to add `|| true` to probes, check each step's output, remember files under `ssh` are remote, and put `host:` on every `rsync`/`scp` source.
- **No flicker or leftovers in fullscreen.** Every panel (model, effort, config, `/status`, `/cost`, rewind, MCP, agents, memory, copy, help and the rest) is now written over in place inside one synchronized update, so arrow keys no longer show it blank first; closing a panel no longer erases the bottom row first; a finished background task no longer leaves fullscreen, prints a line and repaints the whole screen; static pages like `/help` show their clear and content at once; `/model`'s "discovering models…" no longer erases the composer; Esc in `/help` returns straight to the prompt without an extra "press any key"; the pager scrolls without flashing rows.
- **Turning Remote Control off no longer hangs.** `/rc` and `/rcl` stop their background tasks first and wait at most 3 seconds for the goodbye, so an unresponsive relay no longer holds the prompt.
- **No old message after a turn.** Scrolling as a turn ends no longer fills the composer with an earlier prompt or `[Image #N]`: mouse reporting went off for a moment at the handoff, and macOS Terminal, iTerm2 and Ghostty then send the wheel as ↑, which recalled history. It now stays on for the whole fullscreen session. On Enter the composer empties and the message joins the transcript in the same frame, as in Claude Code, so the sent text no longer lingers and the cursor no longer blinks.
- **Red only for a real failure.** As in Claude Code, a running tool shows a gray dot, a finished command is green, and only a command that failed is red. A finished group of commands has no dot, so one `grep` with no match no longer paints the whole group red; Ctrl+O still shows the failed call in red.
- **Compaction keeps up with the context.** The context figure after `/compact` and after a model switch counts the tool definitions and keeps the last real reading, so it no longer jumps after the next message. Switching from a large window (DeepSeek, 1M) to a smaller one (Grok 4.7, 500k) compacts before the next message is sent instead of turning auto-compact off. The end-of-turn check uses the same figure as the bar, so "100% · 0% until auto-compact" now compacts. A compaction in the middle of a turn no longer crashes hipmmcode when the turn ends (`range start index … out of range`). `serve`/SDK sessions and `exec` now auto-compact too.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed and notarized), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Verify downloads with `SHA256SUMS`. Public tag: `v1.3.3`. Desktop is versioned independently — do not make `desktop-v*` GitHub Latest.

# HiPMMCode v1.3.2

Image generation finishes on a slow network, the model calls GenerateImage instead of looking for another way, and `/status` shows where the session is saved.

- **Slow networks.** GenerateImage used to give up 250 seconds after sending the request, even while the finished image was still downloading, and reported it as `malformed response`. The wait for the render (300 s) and the download are timed separately: a download that keeps moving is never cut, and only 60 seconds without data counts as stalled, within 10 minutes in all. A stall says the image was generated and the network is slow. The last poll of a membership image job is no longer cut at 60 seconds. Video downloads (60 minutes) and Grok speech work the same way.
- **GenerateImage is always offered.** It is no longer deferred behind ToolSearch, Turbo included. Call it directly for any picture, poster or illustration. GenerateVideo and GenerateSpeech stay deferred and carry the same rules.
- **Session file in `/status`.** A `Session file` row under `Session ID` shows the absolute path of the session JSON.
- **The status row on the phone too.** Under Remote Control the terminal's live row goes to the phone as drawn, so the phone shows the same progress, time and tokens.
- **The welcome screen on a narrow terminal.** The lines beside the mark wrap inside their column, or go under the mark when there is no room beside it.
- **The phone follows the terminal into another conversation.** After `/resume` or `/clear`, the phone's chat view shows the new one. A bare `/resume` from the phone lists this folder's recent conversations instead of opening a picker the phone cannot see.
- **The whole conversation on the phone after `/rcl` again.** Turning Remote Control on again in the same conversation clears the phone and sends the whole conversation. Phone-started sessions are unchanged.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed, not notarized this cut), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Check downloads against `SHA256SUMS`. Tag: `v1.3.2`. Desktop builds stay on their own version line. Do not mark `desktop-v*` as GitHub Latest.

# HiPMMCode v1.3.1

The welcome screen now shows HM Bot in coloured braille dots. A turn looks and behaves like Claude Code 2.1.316.

- **Welcome mark.** A 12-row coloured braille HM Bot: spring antenna, gold headband, gold headset, winking smile and blue scarf.
- **Live status.** The spinner names the real action (`Reading`, `Writing`, `Running a web search`), with elapsed time, tokens and thinking.
- **ultrathink.** Typing `ultrathink` raises effort to xhigh, or the model's top level, for that turn. `CLAUDE_CODE_DISABLE_ULTRATHINK=1` turns it off.
- **Markdown.** Italic, bold italic, strikethrough, autolinks, nested ordered lists, quote bars, escapes and line-end backslashes render as in Claude Code.
- **Steady streaming.** What you see while a reply is being written is what stays when it ends. The reply keeps a blank row below the tool group. An unfinished heading, list item or inline code waits until its line is done, a table appears once it is complete, and reasoning before a call no longer shows twice.
- **Line width.** On Linux and Windows a reply row fills the terminal as in Claude Code, so a closing `。` stays on its line. macOS keeps two columns free for its wide `⏺`. Mixed Chinese and English still wraps by character.
- **Remote control.** The corner above the input shows the `/rc` and `/rcl` state (`● /rcl active`, `○ /rc /rcl off`); the effort stays in the footer. `/rcl` reaches the local relay directly, so a system proxy (Clash, Surge) no longer answers 502.
- **Phone control.** New `/remote-control-sessions` (`/rcs`): every Remote Control session on this computer (`/rc`, `/rcl`, started from a phone) with the phones connected to each; disconnect or end one, show its QR code, disconnect a phone and remove its SSH key. `hipmmcode remote-control --list` prints the same list; `--disable` / `--enable` turn it off and on for the whole computer. Slash commands sent from a phone never leave a dialog waiting here: usage, status and context come back as text, and terminal-only commands say why they did not run. The phone can send pictures and PDFs (attached to that turn), complete `@` file paths in the session folder, and review the diff. It can also browse and open files in the session folder (sensitive files such as `~/.ssh` are refused) and pick up a saved conversation again (started with `--resume` in that session's tmux). A session started from a phone no longer stops at the folder-trust prompt.
- **Slash menu and MCP.** Fuzzy search ranks commands the same way. MCP servers get progress, elicitation forms, list refreshes, resource templates and argument completion.
- **Permissions.** `permissions.blockWritesOutsideWorkingDirectories` stops Write, Edit and NotebookEdit outside the working directories in every mode. A call a rule denies shows `Not run · permission denied` and the reason.
- **Shell timeouts.** A command that reaches its timeout moves to the background with the output so far.
- **Compaction.** A reply with no summary is asked for once more before falling back.

**Platforms:** macOS (Apple Silicon, Intel, and universal; Developer ID signed), Linux (x64 and arm64, musl static), and Windows (x64, unsigned). Check downloads against `SHA256SUMS`. Tag: `v1.3.1`. Desktop builds stay on their own version line. Do not mark `desktop-v*` as GitHub Latest. The 16-file upload set is `dist/upload-v1.3.1/`. GitHub Latest stays v1.2.3 until this release is published.

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
