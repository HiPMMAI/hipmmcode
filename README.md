# hipmmcode

> 🌐 English · 中文在下方

**hipmmcode** is a provider-agnostic AI coding agent for your terminal: a fullscreen TUI that orchestrates teams of LLM agents across 29+ model channels (Anthropic, OpenAI, Gemini, DeepSeek, Kimi, MiniMax, DashScope, GLM, custom proxies, …).

**New in v1.1.1 — `/status` shows the live `/rename` title, Grok-like mouse select, platform usage in credits.** `/rename` is visible in Status before the first autosave. Click-to-caret and drag-copy in the composer and transcript. `/usage` shows remaining **积分**. `/voice lang` is the STT spoken-language hint, not a translator. `GenerateVideo` accepts last still / paste / local JPEG/PNG/WebP.

**New in v1.1.0 — platform membership, Grok CLI-style search, citations off by default.** `/login` binds Inclusive / Premium / VIP as `inclusive-grok` / `premium-grok` / `vip-grok`. Official Grok search uses Responses `web_search` (server search + browse). `/sources` and `/cite` default **off**; bare commands open Enable/Disable pickers. Welcome shows `email · VIP`. `GenerateVideo` supports official i2v and r2v.

**New in v1.0.10 — one Thinking row on a narrow terminal, and a signed macOS CLI.** The empty-composer placeholder wraps at the column width so the spinner cannot stamp a second Thinking line after autowrap. `darwin-arm64` / `darwin-x64` / `darwin-universal` binaries are Developer ID signed and notarized (Gatekeeper looks up the ticket; standalone Mach-O is not stapled like a `.app`).

**New in v1.0.9 — spoken Grok replies, slash-arg ghost hints, and Command-click that opens the real image.** `/voice talk` and `/voice speak` pipe Grok TTS to the speakers with no leftover file. Default TTS speed is **1.2**; `/tts speed slow|normal|fast` (or `0.7–1.5`). Typing `/tts` shows dim `[voice|speed]`. A glued label such as `路径：/Users/…/photo.jpg` is stripped before open. Grok video / TTS / STT / Realtime work on SuperGrok OAuth and a third-party `XAI_BASE_URL` relay.

**New in v1.0.7 — DeepSeek V4.1 Flash native vision, and a compact welcome H.** `deepseek` / `deepseek-anthropic` suggest `deepseek-flash` (👁) and `deepseek-v4-pro`. Image turns stay on the selected model — no vision-exp detour. `deepseek-v4-pro` does not accept images. The startup header is a braille H with bold `iPMM` and dim `Code`.

**New in v1.0.6 — Ctrl+V image paste in the macOS terminal.** Terminal.app and iTerm2 swallow Cmd+V when the clipboard is an image. The idle composer, mid-turn editor, and readline now honor **Ctrl+V**: a screenshot becomes `[Image #N]`; text still pastes as text. Cmd+V in VS Code / Cursor is unchanged. Ctrl+C remains interrupt, not copy.

**New in v1.0.5 — DeepSeek Files API, LM Studio local loops.** Images are uploaded with `POST /files`; the chat JSON only carries `{type: "file", file_id}` (still the picture). File refs can total 128 MiB. LM Studio origins get `/v1` automatically; tool schemas include `properties`; local prefill waits 10 minutes so prompt processing is not cut at 30%. Read-only MCP (`kb_status` / `kb_search`) skips Auto. Flash/Pro still detour image turns to `deepseek-v4-flash-vision-exp`.

**New in v1.0.4 — DeepSeek vision.** `deepseek` and `deepseek-anthropic` suggest `deepseek-v4-flash`, `deepseek-v4-pro`, and `deepseek-v4-flash-vision-exp` (👁). Images go out on Chat Completions (`image_url`), Anthropic Messages, and Responses (`input_image`). A Flash/Pro session that receives an image this turn is sent to vision-exp for that turn only; the next text-only turn returns to Flash/Pro without changing the selected model.

**New in v1.0.3 — TUI transcript polish and robustness fixes.** Messages queued mid-turn keep their `[Image #N]` / `[Pasted text #N]` placeholders in the sent bubble; queued messages are consumed into their own block so replies are never glued to the user bubble; the turn screen always tears down before post-turn bookkeeping so running tool rows can't blink forever; tokenless `Edit`/`Write` bind to the most recent `Read` (snapshot mismatches report the correct token, `~` rewrites are tolerated while `./` and symlink aliases are rejected); and a successful manual `/compact` re-arms auto-compaction.

**New in v1.0.2 — `/turbo` slim runtime profile.** `/turbo on|off|toggle` is a session profile, not a permission mode. Turbo is Auto with the cheap classifier skipped; high-risk tools still ask. Each turbo request sends a short system prompt plus core tools and connected `mcp__*` schemas. Skills and extra tools load through `ToolSearch`. `/fast` stays a channel switch and `/effort max` still works. Plan write refusals render as errors; “开始干活” only leaves Plan when the protected plan file is non-empty.

**New in v1.0.1 — same-machine cross-session chat, fork subagents, and keep-partial Esc / Send now.** Type `@session-name` to mention another live HiPMMCode process; `SendMessage` / `ListPeers` use a local Unix socket, and `/peer list|accept|refuse` manages held inbound mail. `subagent_type: "fork"` inherits the parent transcript. Esc / Send now keep already-streamed assistant text. Auto mode honors `AskUserQuestion` answers as user intent; GitLab tokens are redacted and `HIPMMCODE_WEBFETCH_CACHE_TTL_MS` is tunable. Cross-machine `bridge:` is not implemented.

**New in v1.0.0 — reuse the local Codex Computer Use plugin without bundling it.** HiPMMCode discovers the newest enabled local `computer-use` plugin and uses its typed MCP tools in place; no Codex binary, plugin asset, or native service is copied into the release. `/computer-use` opens an arrow-key + Enter picker for Enable / Disable / View status, while `/computer-use on|off|status` applies directly and rebuilds the current session's tool catalog. The independent switch defaults off, plugin paths/cwd stay contained, subprocess environment inheritance is minimized, and native authorization on supported macOS and Windows installations remains owned by the installed Codex service.

**New in v0.17.2 — Codex and membership-channel compatibility.** Responses requests sent through `openai-codex` or a membership gateway now omit the unsupported `temperature`, `stop`, and `max_output_tokens` parameters. Hidden Auto mode classification no longer fails with HTTP 400 and fail-closes otherwise valid tool calls; standard OpenAI-compatible endpoints keep their existing behavior.

**New in v0.17.0 — native Qwen Token Plan multimedia.** `GenerateImage`, `GenerateVideo`, and `GenerateSpeech` now call the direct Token Plan services with the configured `sk-sp-...` key—no Skill and no pay-as-you-go fallback. Video supports resumable HappyHorse t2v/i2v/r2v jobs; speech uses `qwen-audio-3.0-tts-plus` over the official WebSocket with `longanlingxin` by default and MP3/WAV/Opus/PCM output. Qwen 3.8 Max defaults to `xhigh` reasoning. `--include-partial-messages` adds live per-token `stream_event` / `content_block_delta` frames to `stream-json`, while the default settled-output contract remains compatible. Permission gates, new-only output paths, and non-retryable billable submissions keep Credits and files safe.

**New in v0.16.2 — complete Qwen Token Plan and pay-as-you-go routing.** `qwen-token-plan` (OpenAI-compatible; alias `qwen-token-plan-openai`) and `qwen-token-plan-anthropic` use isolated `sk-sp-...` Token Plan credentials, while `qwen` and `qwen-anthropic` use separate DashScope pay-as-you-go keys. Direct Token Plan channels can generate images through the dedicated interactive-tool endpoint. `hipmmcode skill add QianWen-AI/qianwen-ai` installs the official QianWen skill pack (standard `sk-...` required by its execution scripts). CLI, SDK/headless, and ACP resolve aliases consistently; usage counters are not remaining Token Plan Credits. Windows installation docs also include an in-place PowerShell `PATH` refresh.

**New in v0.16.1 — clean wrapped prompts and reliable isolated execution.** Long model/API-key prompts repaint without duplicated rows. Linux sandbox hiding now distinguishes directories, credential files, and stale missing paths, so bubblewrap jobs no longer fail on deployment `.env` entries while tenant isolation remains fail-closed. Product and documentation links use `www.hipmmai.com` consistently.

**New in v0.16.0 — config-path flexibility, collapsible background tasks, stabler check commands.** `HIPMMCODE_CONFIG_DIR` / `CLAUDE_CONFIG_DIR` select the config root (default `~/.hipmmcode`). Consecutive background-task status lines collapse into one `⏺ Background tasks (N)` row (click / `Ctrl+O` to expand). Check-style commands that exit 0 with no output no longer false-fail; empty cgroups clean up more reliably; `hipmmcode daemon stop-service <name> [--force]` stops a single named service.

**New in v0.15.0 — xAI Grok device-code OAuth, Imagine images, Responses web search.** `hipmmcode model xai-oauth` signs in with a device code (or reuses `~/.grok/auth.json`); tokens auto-refresh. `GenerateImage` uses xAI Imagine on Grok channels; `WebSearch` uses Responses `web_search`. DeepSeek V4 API ids and the mid-turn **[Send now]** / double-Enter queue polish round out the release. See the [release notes](RELEASE_NOTES.md) for details.

**New in v0.14.1 — Claude-matched scrolling and explicit provider search routing.** Mouse-wheel scrolling ports Claude Code 2.1.220's complete time-driven acceleration model, detects current VS Code/xterm.js releases without an obsolete version ceiling, and is black-box verified against Claude Code in tmux and real VS Code. True Anthropic-native endpoints use hosted `web_search_20250305`, while OpenAI-compatible channels and Anthropic-shaped proxies that return ordinary `tool_use` calls use client-side AnySearch. The Unix Bash launcher also removes a conflicting process-group setup that made `setsid()` fail with `EPERM` on macOS.

**New in v0.13.3 — code intelligence and workflow isolation.** New Tree-sitter codebase-graph, fast reflink worktree, and workflow-host crates add cross-file navigation, isolated parallel-agent workspaces, and durable workflow lifecycle management. Provider credential refresh, schema-guided tool-input coercion, new hook seams, safer repeated compaction, and plugin SHA-256 pinning harden long-running agent sessions.

**New in v0.12.2 — web research that finishes the job.** Pointed at any Anthropic-compatible base URL (e.g. DeepSeek's `/anthropic` endpoint) with only `ANTHROPIC_AUTH_TOKEN` set, hipmmcode detects the credential and runs `web_search` server-side, returning current-year results with a `Sources:` list — no separate search key. The per-turn search budget is raised to 8 (200 per session), so a complex question drives several searches across multiple rounds until it is answered; endpoints that reject the native `web_fetch` fall back to a client-side fetch instead of failing the request. The HUD tool tally now counts **every** tool live while the turn streams — including provider-hosted search/fetch, which the fullscreen view previously never counted at all.

**New in v0.12.0 — managed Artifact publishing, one implicit team, and a self-describing agent.** `/publish` now accepts Markdown or full HTML (`--file`), adds `--template morning-brief|plan|dataviz`, and can `--enhance` into a polished self-contained page; the model can drive publish / update / list / visibility / delete through the `Artifact` tool, backed by a private canonical source so an artifact can be updated without changing its share URL. Multi-agent work collapses to **one implicit team per session** — named `Agent` calls, `Task*`, `SendMessage`, and `ListPeers` resolve automatically, agents run asynchronously by default, and shared per-session caps bound spawning and web search. MCP tool catalogs **refresh live** (`RefreshMcpTools`) without restarting; `/auto-mode-setup` proposes strictly typed settings for explicit review before applying; product-feedback drafts stay fully local. The system prompt now carries a **self-describing capability overview** generated from the tools actually enabled, so "what can you do?" stays complete and current, and running a skill or custom command as `/name` shows the typed command instead of dumping its whole body into scrollback.

**New in v0.10.1 — no flicker, and codex/membership channels work end-to-end.** The post-generation black flash, the send-time flash, and the per-Shift+Tab flash are eliminated at the root (a single state-guarded alternate-screen owner). A wide-reaching silent failure on **codex / membership channels** is fixed at its source: the ChatGPT Codex backend rejects `max_output_tokens` with a `400`, which was quietly breaking the **auto-mode classifier** (so auto mode kept prompting for approval on nearly every tool), `/compact`, session auto-naming, memory recall, and `/goal` — one adapter fix restores them all. Image generation over a membership gateway is now an **async job** (fast job id + short polls) that survives proxies with a ~30s idle timeout. Plus: a right-aligned **conversation-title chip** on the input border after turn 1, auto mode runs `GenerateImage` without prompting, permission grants persist to hipmmcode's own **`.hipmmcode/settings.json`** (still reading `.claude/` for compatibility), and code previews are legible on light-background terminals.

**New in v0.10.0 — one-approval autonomous tasks + a quieter auto mode.** Plan mode can now approve one bounded task in a single confirmation — with frozen scope, budgets, and expiry — including, on Linux, sandboxed patch-producing edits and offline Cargo build/test. Auto mode stops prompting for read-only tools (fixed allow-list, checked before the classifier). New TUI: **Shift+Tab** cycles the permission mode, **Ctrl+T** opens a persistent Tasks panel, **Ctrl+B** sends running foreground work to the background. Tool loading is aligned tool-for-tool with the leading coding agents (stable schema order restores prompt caching; MCP tools no longer 400 on OpenAI Responses), and image generation through the membership gateway no longer times out on long renders (250s budget + automatic retry).

**v0.9.2** fixes `hipmmcode update`: it works on Windows now, and no longer hard-refuses on npm/Homebrew installs (warns and updates in place instead). Updating *to* v0.9.2 still needs the package manager one time (`npm install -g @hipmmai/hipmmcode@latest`, or the Windows `install.ps1`); after that `hipmmcode update` works everywhere.

**v0.9.1** adds member self-service — `hipmmcode member me` (see your own quota/usage) and `hipmmcode member set-gateway <url>` (move to a new gateway URL, e.g. an HTTPS front, without re-joining) — and fixes chat messages that begin with a filesystem path (`/Users/…`) being rejected as an unknown command.

**New in v0.9.0 — membership gateway:** share ONE authorized Codex (or any upstream) subscription with many **device-bound** members, without handing anyone a copy-pasteable key. The admin runs `hipmmcode serve --gateway`, issues each member a one-time `hipmmcode join` code (with its own quota / validity / device-cap / model allow-list), and watches usage live — while members get a fully transparent proxy (web search, image generation, reasoning effort all work identically). See the release notes and `docs/GATEWAY_DEPLOY.md`.

Distributed as prebuilt binaries. ✦ This repository hosts **releases and documentation only**.

## Desktop v1.0.7

HiPMMCode Desktop **v1.0.7** packages the Web workspace with compiled
**hipmmcode v1.0.6**. The Desktop and CLI release lines stay independent:

- **macOS Apple Silicon and Intel:** Developer ID signed, Apple-notarized, and
  stapled DMG and App.zip. Gatekeeper should accept Notarized Developer ID.
- **Windows x64:** intentionally unsigned NSIS installer. Microsoft Defender
  SmartScreen may warn or block installation until Authenticode signing is
  introduced.
- **Linux x64:** unsigned AppImage and Debian `.deb` packages.
- Every package is covered by the release `SHA256SUMS` file.

The immutable Desktop tag is **`desktop-v1.0.7`** (bundled core 1.0.5). It must
not replace the CLI `v1.0.7` release as GitHub **Latest**, because the terminal
installers below use `releases/latest/download/install.sh` and `install.ps1`. See
[Desktop release notes](DESKTOP_RELEASE_NOTES.md) for the exact asset manifest,
installation notes, and checksum verification.

## Install

**Platforms**: macOS (Apple Silicon & Intel), Linux (x64 & arm64), and Windows (x64) — all native.

**curl (recommended)**

```bash
curl -fsSL https://github.com/HiPMMAI/hipmmcode/releases/latest/download/install.sh | bash
```

**Homebrew (macOS)**

```bash
brew tap hipmmai/hipmmcode https://github.com/HiPMMAI/hipmmcode
brew install hipmmcode
```

**npm** (any OS with Node)

```bash
npm install -g @hipmmai/hipmmcode
```

**Windows (PowerShell)**

```powershell
irm https://github.com/HiPMMAI/hipmmcode/releases/latest/download/install.ps1 | iex
```

If the install succeeds but `hipmmcode` or `hipmmcode model` is not recognized in the current PowerShell window, open a new terminal or refresh `PATH` in place:

```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
hipmmcode --version
hipmmcode model
```

**Manual** — grab a tarball from [Releases](../../releases/latest) (`darwin-universal` runs on both Apple Silicon and Intel Macs), untar, put `hipmmcode` on your PATH, verify against `SHA256SUMS`.

## Quick start

```bash
hipmmcode model        # interactive channel wizard: pick a provider, paste an API key, choose a model
hipmmcode              # fullscreen TUI REPL (mouse support, pinned status bar)
hipmmcode "one-shot prompt"            # headless exec
hipmmcode integration | less          # full guide for driving hipmmcode from other programs
```

Highlights: fullscreen terminal UI with mouse support · parallel agent teams · MCP servers (standard `.mcp.json`) · skills, hooks, fine-grained permissions, git-worktree isolation · session resume/rename · stream-json SDK protocol + `hipmmcode serve` (HTTP/WS) · persistent cross-session memory.

## Updating

```bash
hipmmcode update           # self-update to the latest release
hipmmcode update --check   # just check whether a newer version exists
```

(`brew upgrade hipmmcode` / re-running the curl installer also work.)

## Uninstall

```bash
rm ~/.local/bin/hipmmcode        # curl install (or wherever you installed it)
brew uninstall hipmmcode         # Homebrew install
npm uninstall -g @hipmmai/hipmmcode       # npm install
rm -rf ~/.hipmmcode              # optional: remove all user data (config, sessions, memory)
```

## License

Binary-only, free to use; no redistribution or reverse engineering. See [LICENSE.txt](LICENSE.txt).

---

# hipmmcode（中文）

**hipmmcode** 是终端里的全能 AI 编程智能体:全屏 TUI,可在 29+ 模型渠道(Anthropic、OpenAI、Gemini、DeepSeek、Kimi、MiniMax、通义、智谱、自定义代理……)上编排 LLM 智能体团队。

**v1.1.1 新增 —— `/status` 显示当前 `/rename` 名称、Grok 同款鼠标点选、平台用量按积分。** `/rename` 在第一次自动保存前就会出现在 Status。输入框点击定位、拖选复制；对话区拖选复制。`/usage` 显示剩余 **积分**。`/voice lang` 是 STT 口语提示，不是翻译。`GenerateVideo` 可用上一张静帧 / 粘贴图 / 本地 JPEG/PNG/WebP。

**v1.1.0 新增 —— 平台会员、Grok CLI 同款检索、引用默认关闭。** `/login` 绑定普惠 / 高级 / 尊享为 `inclusive-grok` / `premium-grok` / `vip-grok`。官方 Grok 检索走 Responses `web_search`。`/sources` 与 `/cite` **默认关闭**，裸命令打开选择器。欢迎页显示 `email · VIP`。`GenerateVideo` 支持官方图生视频与参考生视频。

**v1.0.10 新增 —— 窄终端 Thinking 不再闪出两行；macOS CLI 签名公证。** 空输入框占位符按列宽换行，spinner 不会在旧行再打一颗星。`darwin-arm64` / `darwin-x64` / `darwin-universal` 用 Developer ID 签名并提交 Apple 公证（独立 Mach-O 不能像 `.app` 那样 staple，Gatekeeper 联网核验票据）。

**v1.0.9 新增 —— Grok 回复播报、斜杠命令幽灵提醒，Command+点击能打开真实图片。** `/voice talk` / `/voice speak` 把 Grok TTS 直接灌进扬声器，不落盘。默认速度 **1.2**；`/tts speed slow|normal|fast`（或 `0.7–1.5`）。输入 `/tts` 会淡显 `[voice|speed]`。`路径：/Users/…/photo.jpg` 这种中文标签会先剥掉再打开。Grok 视频 / TTS / STT / Realtime 同时覆盖 SuperGrok OAuth 和第三方 `XAI_BASE_URL` 中转。

**v1.0.7 新增 —— DeepSeek V4.1 Flash 原生识图，启动点阵 H。** `deepseek` / `deepseek-anthropic` 建议 `deepseek-flash`（👁）和 `deepseek-v4-pro`。贴图走当前选中的模型，不再绕行 vision-exp。`deepseek-v4-pro` 不接受图片。启动屏左侧点阵 H，右侧粗体 `iPMM` 加浅色 `Code`。

**v1.0.6 新增 —— macOS 终端 Ctrl+V 贴图。** Terminal.app / iTerm2 在剪贴板是图片时会吞掉 Cmd+V。空闲输入框、回合中编辑和行编辑现在都响应 **Ctrl+V**：截图变成 `[Image #N]`，文字照常粘贴。VS Code / Cursor 里 Cmd+V 不变。Ctrl+C 仍是中断，不是复制。

**v1.0.5 新增 —— DeepSeek Files API，LM Studio 本地循环。** 先 `POST /files` 上传图像素，聊天 JSON 只带 `{type: "file", file_id}`（仍是图）。文件引用合计 128 MiB。LM Studio 地址自动补 `/v1`；工具 schema 带 `properties`；本地预填充等到 10 分钟。只读 MCP（kb_status / kb_search）跳过 Auto。Flash/Pro 贴图仍只在这一轮走 vision-exp。

**v1.0.4 新增 —— DeepSeek 识图。** `deepseek` 与 `deepseek-anthropic` 建议 `deepseek-v4-flash`、`deepseek-v4-pro`、`deepseek-v4-flash-vision-exp`（👁）。图片走 Chat Completions `image_url`、Anthropic Messages、Responses `input_image`。Flash/Pro 会话本轮带图时整轮发到 vision-exp，下一轮纯文本仍回原模型，选中的模型不变。

**v1.0.3 新增 —— TUI 转录打磨与健壮性修复。** 回合中排队消息保留 `[Image #N]` / `[Pasted text #N]` 占位符，发送后不再变成 `[image: clipboard]`；排队消息被消费后助手回复独立成块，不再紧贴用户消息；回合屏拆除前移到所有回合后簿记之前，running 工具行不再永久闪烁；无 token 的 `Edit`/`Write` 绑定最近一次 `Read`（snapshot 不匹配报错附正确 token，容忍 `~` 前缀改写、拒绝 `./` 与符号链接别名）；成功的手动 `/compact` 会复位断路器，自动压缩重新武装。

**v1.0.2 新增 —— `/turbo` 极速运行时档。** `/turbo on|off|toggle` 是会话档，不是权限模式。Turbo 就是 Auto，并跳过便宜分类器；高风险工具仍要确认。每一轮发出短系统提示、核心工具和已连接的 `mcp__*` schema；技能和其余工具用 `ToolSearch` 按需加载。`/fast` 仍只切渠道，`/effort max` 仍可用。计划文件拒写显示为错误；「开始干活」只有在受保护计划非空时才会离开 Plan。

**v1.0.1 新增 —— 本机跨会话、Fork 子代理、Esc / Send now 保留已生成内容。** `@会话名` 点名另一台正在跑的 HiPMMCode；`SendMessage` / `ListPeers` 走本机 Unix socket，`/peer list|accept|refuse` 处理暂挂来信。`subagent_type: "fork"` 继承父对话。Esc / Send now 不再抹掉已生成文字。Auto 认 `AskUserQuestion` 答案；GitLab token 会打码，`HIPMMCODE_WEBFETCH_CACHE_TTL_MS` 可调。跨机器 `bridge:` 未实现。

**v1.0.0 新增 —— 不打包 Codex 也能复用本机 Computer Use。** HiPMMCode 自动发现本机最新、已启用的 `computer-use` 插件，原地调用其 typed MCP 工具；Codex 二进制、插件资产和原生服务都不会被复制到发布包。`/computer-use` 提供方向键+回车的“开启 / 关闭 / 查看状态”选择器，`/computer-use on|off|status` 可直接操作并立即重建当前会话的工具目录。独立开关默认关闭，插件路径/cwd 受限，子进程环境继承最小化，受支持的 macOS 与 Windows 原生授权仍由已安装的 Codex 服务负责。

**v0.17.2 新增 —— Codex 与会员渠道兼容性修复。** `openai-codex` 与会员网关的 Responses 请求现在会省略后端不支持的 `temperature`、`stop` 和 `max_output_tokens` 参数。Auto mode 隐藏分类器不再因 HTTP 400 而 fail-closed 拦截原本有效的工具调用；标准 OpenAI 兼容端点行为保持不变。

**v0.17.0 新增 —— 千问 Token Plan 原生多媒体。** `GenerateImage`、`GenerateVideo`、`GenerateSpeech` 直连 Token Plan 服务并复用 `sk-sp-...`，无需 Skill，也不回退到按量付费。视频支持可恢复的 HappyHorse t2v/i2v/r2v；语音通过官方 WebSocket 调用 `qwen-audio-3.0-tts-plus`，默认 `longanlingxin`，输出 MP3/WAV/Opus/PCM。Qwen 3.8 Max 默认 `xhigh`；`--include-partial-messages` 可让 `stream-json` 实时输出逐 Token 的 `stream_event` / `content_block_delta`，默认完整消息协议保持兼容。权限门禁、仅新建输出与付费提交不盲目重试共同保护 Credits 和本地文件。

**v0.16.2 新增 —— 千问 Token Plan 与按量付费四渠道完整接入。** `qwen-token-plan`（OpenAI 兼容，别名 `qwen-token-plan-openai`）与 `qwen-token-plan-anthropic` 使用隔离的 `sk-sp-...` Token Plan 凭据；`qwen` 与 `qwen-anthropic` 使用独立的 DashScope 按量付费密钥。CLI、SDK/无头模式和 ACP 的别名解析保持一致。流式用量保留输入/输出、缓存创建/读取和推理 Token 明细，但不会把 Token 计数误报为剩余 Credits。Windows 安装说明也补充了 PowerShell 原地刷新 `PATH` 的方法。

**v0.16.1 新增 —— 长提示干净重绘、隔离任务可靠启动。** 模型/API Key 长提示不再重复刷屏；Linux 沙箱会正确区分隐藏目录、凭据文件和不存在的过期路径，部署 `.env` 条目不再导致 bubblewrap 启动失败，同时继续保持租户隔离 fail-closed。产品和文档链接统一使用 `www.hipmmai.com`。

**v0.16.0 新增 —— 配置目录可指定、后台任务可折叠、check 命令更稳。** `HIPMMCODE_CONFIG_DIR` / `CLAUDE_CONFIG_DIR` 可选配置根目录（默认 `~/.hipmmcode`）。连续后台任务状态行折叠为一条 `⏺ Background tasks (N)`（点击 / `Ctrl+O` 展开）。无输出且 exit 0 的 check 类命令不再误报失败；空 cgroup 清理更可靠；`hipmmcode daemon stop-service <name> [--force]` 可单独停一个命名服务。

**v0.15.0 新增 —— xAI Grok 设备码 OAuth、Imagine 出图、Responses 联网。** `hipmmcode model xai-oauth` 设备码登录（或复用 `~/.grok/auth.json`），token 自动刷新。Grok 渠道上 `GenerateImage` 走 Imagine，`WebSearch` 走 Responses `web_search`。DeepSeek V4 API id 与回合中 **[Send now]** / 双 Enter 队列一并打磨。详情参见[发行说明](RELEASE_NOTES.md)。

**v0.14.1 新增 —— 与 Claude 一致的滚动及明确的 Provider 搜索路由。** 鼠标滚轮完整移植 Claude Code 2.1.220 按时间驱动的加速模型，现代 VS Code/xterm.js 版本不再受过时版本上限影响，并已通过 tmux 黑盒测试和真实 VS Code 测试与 Claude Code 对照验证。真正支持 Anthropic 原生工具的端点使用服务端 `web_search_20250305`；OpenAI 兼容渠道及返回普通 `tool_use` 的 Anthropic 外形代理使用客户端 AnySearch。Unix Bash 启动器还移除了会导致 macOS `setsid()` 返回 `EPERM` 的冲突进程组设置。

**v0.13.3 新增 —— 代码智能与工作流隔离。** 新增基于 Tree-sitter 的代码库图、快速 reflink worktree 与 workflow-host crate，提供跨文件导航、并行 agent 隔离工作区和可持久化的工作流生命周期管理。Provider 凭证刷新、工具输入按 Schema 强制转换、新的钩子缝、重复压缩保护和插件 SHA-256 锁定进一步加固长时间运行的 agent 会话。

**v0.12.2 新增 —— 会把问题查到底的 Web 检索。** 指向任意 Anthropic 兼容 base URL(如 DeepSeek 的 `/anthropic` 端点）、仅设置 `ANTHROPIC_AUTH_TOKEN` 时,hipmmcode 会识别该凭证并在服务端运行 `web_search`,返回带 `Sources:` 列表的当年结果,无需单独的搜索 key。每回合搜索预算提高到 8 次(每会话 200 次）,复杂问题可以跨多轮持续检索直到得出答案;拒绝原生 `web_fetch` 的端点会回退为客户端抓取,而不是让整个请求失败。HUD 工具计数现在会在回合进行中实时统计**每一个**工具——包括服务端托管的搜索/抓取,而全屏视图此前对它们完全不计数。

以预编译二进制发行。✦ 本仓库只承载**发布产物与文档**。

## 桌面版 v1.0.7

HiPMMCode Desktop **v1.0.7** 将 Web 工作台与编译后的 **hipmmcode v1.0.5**
一起打包。桌面版与 CLI 是两条独立发布线：

- **macOS Apple Silicon 与 Intel：** Developer ID 已签名、Apple 已公证并装订的
  DMG 与 App.zip。Gatekeeper 应识别为已公证应用。
- **Windows x64：** 当前明确为未签名 NSIS 安装包；引入 Authenticode
  签名之前，Microsoft Defender SmartScreen 可能警告或拦截。
- **Linux x64：** 当前为未签名 AppImage 与 Debian `.deb`。
- 所有安装包均由 release 中的 `SHA256SUMS` 覆盖。

桌面版使用不可变标签 **`desktop-v1.0.7`**（内置核心 1.0.5），不要将它设为
GitHub **Latest**。下方终端安装命令依赖 `releases/latest/download/install.sh`
与 `install.ps1`，因此 CLI `v1.0.7` 必须继续保持 Latest。完整文件清单、安装
提示和校验方法见[桌面版发行说明](DESKTOP_RELEASE_NOTES.md)。

## 安装

**平台支持**:macOS(Apple Silicon 与 Intel)、Linux(x64 与 arm64)、Windows(x64)——全部原生支持。

**curl(推荐)**

```bash
curl -fsSL https://github.com/HiPMMAI/hipmmcode/releases/latest/download/install.sh | bash
```

**Homebrew(macOS)**

```bash
brew tap hipmmai/hipmmcode https://github.com/HiPMMAI/hipmmcode
brew install hipmmcode
```

**npm**(任何有 Node 的系统)

```bash
npm install -g @hipmmai/hipmmcode
```

**Windows(PowerShell)**

```powershell
irm https://github.com/HiPMMAI/hipmmcode/releases/latest/download/install.ps1 | iex
```

如果安装成功后，当前 PowerShell 仍提示找不到 `hipmmcode` 或无法执行 `hipmmcode model`：

1. 关闭当前终端并重新打开；或
2. 在当前窗口手动刷新 `PATH`，立即读取系统与用户的最新配置：

```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
hipmmcode --version
hipmmcode model
```

**手动** —— 从 [Releases](../../releases/latest) 下载压缩包(`darwin-universal` 同时支持 Apple Silicon 与 Intel Mac),解压后把 `hipmmcode` 放进 PATH;用 `SHA256SUMS` 校验。

## 快速上手

```bash
hipmmcode model        # 交互式渠道向导:选渠道、填 API Key、选默认模型
hipmmcode              # 全屏 TUI REPL(支持鼠标、钉底状态栏)
hipmmcode "一次性提示词"               # 无头 exec
hipmmcode integration | less          # 外部程序接入完整手册(内嵌于二进制)
```

亮点:全屏终端 UI + 鼠标 · 并行智能体团队 · MCP(标准 `.mcp.json`)· 技能/Hooks/细粒度权限/worktree 隔离 · 会话续接与重命名 · stream-json SDK 协议 + `hipmmcode serve`(HTTP/WS)· 跨会话持久记忆。

## 升级

```bash
hipmmcode update           # 一键自更新到最新版
hipmmcode update --check   # 只检查是否有新版
```

(`brew upgrade hipmmcode` 或重跑 curl 安装命令同样有效。)

## 卸载

```bash
rm ~/.local/bin/hipmmcode        # curl 安装(或你自定义的安装目录)
brew uninstall hipmmcode         # Homebrew 安装
npm uninstall -g @hipmmai/hipmmcode       # npm 安装
rm -rf ~/.hipmmcode              # 可选:清除全部用户数据(配置/会话/记忆)
```

## 许可

仅二进制、免费使用;禁止再分发与逆向。详见 [LICENSE.txt](LICENSE.txt)。
