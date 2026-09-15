# HiPMMCode v1.1.0 更新总结

平台会员（普惠 / 高级 / 尊享）、Grok 检索对齐 Grok CLI，引用默认关闭。

- **平台套餐。** `/login` 绑定 `inclusive-grok` / `premium-grok` / `vip-grok`。`/logout` 只解绑套餐。语音与 `/tts` `/voice` 跟套餐走；官方多媒体需尊享且当前对话在 OAuth。
- **Grok 检索。** Responses 服务端 `web_search`（搜+浏览），不再跟一轮失败的 WebFetch。`/sources` 管文末链接，`/cite` 管 `[1]` `[2]`，**默认都关**。裸命令打开选择器。
- **欢迎页与底栏。** `email · VIP`（或 Inclusive / Premium / None）。会员色只上平台渠道，不上 `xai-oauth`。
- **Grok 视频。** 官方图生视频与参考生视频（参考最多 7 张；参考模式最高 720p）。
- **斜杠选择器。** 裸 `/vim` `/compat` `/pet` `/brief` `/focus` `/pause-memory` `/advisor` 等 ↑↓ + 回车；`on`/`off` 仍可用。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.1.0`。桌面版独立版本。

# HiPMMCode v1.0.10 更新总结

窄终端里 Thinking 不再闪出两行；macOS 二进制 Developer ID 签名并公证。

- **Thinking 双行。** 空输入框的长占位符按列宽换行（和打字时同一套 wrap），100ms 的 spinner 刷新不会在旧行再打一颗星。空闲输入框同样处理。底栏过长时截断，不再把占位符残字混进状态行。
- **macOS 签名公证。** `darwin-arm64` / `darwin-x64` / `darwin-universal` 的 `hipmmcode` 用 Developer ID Application 加 hardened runtime 签名，并提交 Apple 公证。独立 Mach-O 不能像 `.app` 那样 staple；Gatekeeper 联网核验票据。Linux / Windows 包不签 Apple 证书。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.10`。桌面版独立版本。

# HiPMMCode v1.0.9 更新总结

Grok 回复播报、斜杠命令幽灵提醒，以及能真正打开图片的 Command+点击。

- **回复播报。** `/voice talk` / `/voice speak` 把 Grok TTS 直接灌进扬声器，不落盘。默认速度 **1.2**。`/tts speed slow|normal|fast` 或 `0.7–1.5`。播放条：暂停 / 继续 / 停止（`p` / `s`）。
- **幽灵提醒。** 输入 `/tts` 淡显 `[voice|speed]`；空命令打开的选择器页脚同样给出空格后参数。
- **Command+点击路径。** `路径：/Users/…/photo.jpg` 会先剥掉中文标签再打开真实文件。
- **Grok 多媒体**（视频 / TTS / STT / Realtime）随本构建带上，见下方 v1.0.8。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.9`。桌面版独立版本。

# HiPMMCode v1.0.8 更新总结

Grok 视频 / TTS / STT / Realtime：OAuth 与第三方 `XAI_BASE_URL` 中转共用同一套接口。

- **视频。** `GenerateVideo` 在 `xai` / `xai-oauth` 上调用 `POST /videos/generations`，轮询 `GET /videos/{id}`。默认 `grok-imagine-video-1.5`。千问 Token Plan 路径不变。
- **TTS。** `GenerateSpeech` 在 Grok 上 `POST /tts`（默认 `eve`）。`/tts` 选音色（先中文后英文，A–Z）。`/voice talk` / `/voice speak` 把回复直接播报、不落盘。官方 TTS 只选音色，没有 chat 模型。千问 WebSocket TTS 不变。
- **STT。** 新工具 `TranscribeAudio`：`POST /stt` 转写工作区音频文件，不是麦克风流。
- **Realtime。** 新工具 `RealtimeVoice`：`WS /realtime` 文本进、返回转写。TUI 不做双向语音对讲。
- **配置。** 官方 SuperGrok：`hipmmcode model xai-oauth`。中转：`export XAI_BASE_URL=…` 与 `export XAI_API_KEY=…`，渠道 `xai`。不要用 `GROK_MODELS_BASE_URL`。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.8`。桌面版独立版本。

# HiPMMCode v1.0.7 更新总结

DeepSeek V4.1 Flash 原生识图，不再绕行 vision-exp。启动屏换成点阵 H。

- **目录。** `deepseek` / `deepseek-anthropic` 建议 `deepseek-flash`（👁）和 `deepseek-v4-pro`。旧名 `deepseek-v4-flash`、`deepseek-v4-flash-vision-exp` 仍能打通（接口落到 Flash），但不进选择器。
- **贴图走当前模型。** `deepseek-flash` 自己看图，不再把这一轮改写到 vision SKU。`deepseek-v4-pro` 不接受图片。
- **简称。** `flash` / `vision` / `chat` → `deepseek-flash`；`pro` / `v4` → `deepseek-v4-pro`。
- **启动标识。** 左侧点阵 H，右侧粗体 `iPMM` 加浅色 `Code`。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.7`。桌面版独立版本。

# HiPMMCode v1.0.6 更新总结

macOS 终端里 Ctrl+V 可以贴图。

- **Ctrl+V 粘贴截图。** Terminal.app / iTerm2 在剪贴板是图片时会吞掉 Cmd+V，应用收不到粘贴事件。空闲输入框、回合中编辑和行编辑现在都响应 **Ctrl+V**：有图则插入 `[Image #N]`，有文字则照常粘贴。VS Code / Cursor 里 Cmd+V 仍然可用。Ctrl+C 还是中断，不是复制。
- **`/paste` 仍可用**，作为个别宿主仍丢键时的兜底。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.6`。桌面版独立版本。

# HiPMMCode v1.0.5 更新总结

DeepSeek 识图走 Files API；LM Studio 本地模型可跑完整工具循环。

- **JSON 很小，图还是图。** 先 `POST /files` 上传图像素，聊天请求只带 `{type: "file", file_id}`。模型仍按图看。文件引用合计可以到 128 MiB。Files 不可用时压成 JPEG 内联（20 MiB / 48 MiB 请求体帽）。
- **`deepseek-anthropic`。** Messages 不接受 `file_id`，识图轮改走 Chat Completions + Files。Flash/Pro 贴图仍只在这一轮走 vision-exp，输入框不再打印绕行说明。
- **LM Studio。** 粘贴 `http://host:1234` 会自动补 `/v1`；工具 schema 补上 `properties`，不再 HTTP 400。本地预填充等到 10 分钟、出字后空闲 5 分钟，HTTP 空闲读 10 分钟，避免预填充到一半被掐断重来。
- **Auto + 只读 MCP。** `kb_status` / `kb_search` 等只读 MCP 不再走分类器。Bash/Write 在本地单模型上仍可能被 Auto 拦住（分类器与主对话抢同一路推理）。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.5`。桌面版独立版本。

# HiPMMCode v1.0.4 更新总结

DeepSeek 识图：三个官方 SKU；Flash/Pro 贴图只在这一轮走 vision-exp，会话模型不变。

- **官方目录。** `deepseek` / `deepseek-anthropic` 建议 `deepseek-v4-flash`、`deepseek-v4-pro`、`deepseek-v4-flash-vision-exp`。去掉 `pro[1m]`。
- **三条线识图。** Chat Completions `image_url`、Anthropic `image`+`source.base64`、Responses `input_image`。仅 vision SKU 接受图片。
- **一轮绕行。** 当前是 Flash/Pro 且本轮带图时，整轮发到 `deepseek-v4-flash-vision-exp`；下一轮纯文本仍回原模型。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.4`。桌面版独立标签：`desktop-v1.0.4`。

# HiPMMCode v1.0.3 更新总结

## TUI 转录与健壮性修复

- **追加消息保留图片占位符。** 回合中排队消息发送后，气泡保留 `[Image #N]` / `[Pasted text #N]`，不再显示 `[image: clipboard]` 原文。
- **注入气泡分隔。** 追加消息被消费后，AI 回复独立成块，不再紧贴用户消息。
- **回合屏必定拆除。** 拆除动作前移到所有回合后 await 之前；引擎/簿记挂起不再让旧回合的 running 工具行永久闪烁。
- **快照门加固。** tokenless Edit/Write 绑定最近 Read；mismatch 报错附正确 token；`~` 前缀改写容忍（纯字符串层），`./` 与符号链接别名仍拒绝。
- **手动 /compact 后自动压缩重新武装。** 成功的手动压缩复位连续失败断路器。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.3`。桌面版独立标签：`desktop-v1.0.4`（内置本版本核心）。

# HiPMMCode v1.0.2 更新总结

## Turbo 极速档与计划拒写

- **`/turbo` 运行时档。** 与权限模式正交。进入 turbo 就是 Auto，跳过分类器；高风险工具仍走审批卡。`/fast` 仍只切渠道，`/effort max` 可用。
- **极简请求面。** 发出去的是短系统提示，只保留核心工具和已连接的 `mcp__*` schema。技能与其余工具经 `ToolSearch` 再加载。对话历史不变。
- **计划拒写显示为错误。** 受保护计划的 `Write`/`Edit` 返回 `Refusing to…` 时是红色错误，不再刷成绿色“已写入”。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.2`。桌面版独立标签：`desktop-v1.0.4`（内置本版本核心）。

# HiPMMCode v1.0.1 更新总结

## 跨会话、中途取消与 Auto 确认

- **本机跨会话。** `@会话名`、`SendMessage` / `ListPeers` 走本机 UDS；`/peer list|accept|refuse`；`crossSessionInbound` 与 `dialogExpiry`（默认 5 分钟）。不实现跨机器 `bridge:`。
- **Fork 子代理。** `subagent_type: "fork"` 继承父对话；print/SDK 默认关。
- **Esc / Send now 保留已生成内容。** 打断当前轮时把半段助手回复写入历史，再发送排队消息。
- **Auto 认 AskUserQuestion 答案。** 与 Claude 2.1.233 `fVp` 一致，点名后的软拦截可自动执行；硬拦截仍拒绝。
- **GitLab token 脱敏** 与 **`HIPMMCODE_WEBFETCH_CACHE_TTL_MS`**（默认 15 分钟）。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请用 `SHA256SUMS` 校验。公开仓 tag：`v1.0.1`。

# HiPMMCode v1.0.0 更新总结

## Codex Computer Use 本机兼容

- **复用已安装的 Codex 能力。** HiPMMCode 可自动发现本机 Codex 中最新、已启用的 `computer-use` 插件，校验本地 Codex CLI 与 `node_repl` 运行时，并通过隔离的 app-server 暴露固定 typed Computer Use 工具；Codex、插件和原生服务都不会被复制到 HiPMMCode 二进制或发布包中。
- **`/computer-use` 交互开关。** 裸命令使用方向键选择“开启 / 关闭 / 查看状态”，回车确认、Esc 取消；`/computer-use on|off|status` 提供可脚本化的直接形式。开关保存成功后，当前会话会立即重建 Skills、MCP 工具、补全与系统提示，无需重启。
- **默认关闭且 fail-closed。** Codex 内已启用插件不等于授权 HiPMMCode 启动它；独立开关默认为关，`--safe-mode` / `--bare` 也会禁用。辅助 app-server 清空环境后只保留平台必需的固定白名单与 `CODEX_HOME`，禁用其他 MCP 服务和托管 Apps，原始 `node_repl` 工具不会进入模型工具目录。
- **原生桌面授权保持独立。** macOS 与 Windows 上的桌面授权和系统“Stop Using HiPMMCode”控制仍由外部 Codex Computer Use 服务负责，插件发现不会被当成原生授权；Linux 不会假报可用。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请使用 `SHA256SUMS` 校验。

# HiPMMCode v0.17.2 更新总结

## Codex / 会员渠道 Responses 兼容性

- **请求参数与 Codex 后端对齐。** `openai-codex` 与会员渠道现在会省略 ChatGPT Codex Responses 后端不支持的 `temperature` 和 `stop` 参数，并保留已有的 `max_output_tokens` 兼容门控，避免隐藏分类器请求被 HTTP 400 拒绝。
- **Auto mode 恢复正常。** 安全分类器不再因请求参数不兼容而进入 unavailable 状态并 fail-closed 拦截原本有效的工具调用；v0.17.1 的有界重试继续负责真正的瞬时供应商故障。
- **其他 Responses 端点行为不变。** 兼容门控仅作用于 Codex 后端渠道，标准 OpenAI 兼容端点继续保留原有的采样参数与停止序列行为。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请使用 `SHA256SUMS` 校验。

# HiPMMCode v0.17.1 更新总结

## Auto mode 分类器可靠性

- **stage-2 有界重试。** 两段式 Auto 分类器中，重负载的 stage-2 请求遇到瞬时供应商故障时，现在会在共享分类预算（stage-1 60s + stage-2 120s）的剩余时间内做一次有界重试；剩余不足 10 秒时跳过重试，直接 fail-closed。此前第三方通道的一次亚秒抖动就会让良性命令被报为 "Auto mode denied the `Bash` call"。
- **判定语义不变。** `Unavailable` 仍是 deny + retry、不打开人工权限弹窗（Claude parity）；只有 transcript 过长（`TranscriptTooLong`）才回退人工确认。分类器故障期间只读工具照常可用。
- **回归测试。** 新增端到端测试：首次分类器请求瞬时失败后可恢复并正常执行工具；block / unavailable 判定永不打开确认弹窗；both-mode stage-2 恢复路径覆盖有界重试。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请使用 `SHA256SUMS` 校验。

# HiPMMCode v0.17.0 更新总结

## 千问 Token Plan 原生多媒体

- `GenerateImage`、`GenerateVideo`、`GenerateSpeech` 直连 `qwen-token-plan` / `qwen-token-plan-anthropic`，复用同一 `sk-sp-...`，无需安装 Skill，也不会回退到按量付费密钥。
- 生图直接调用百炼多模态 API，并在发起可计费请求前校验模型和尺寸。
- 视频支持 `happyhorse-1.1-t2v` / `i2v` / `r2v`、720P/1080P 与 3–15 秒 MP4；提交前请求确认，私密保存 `task_id`，可恢复轮询/下载而不重复创建付费任务。
- 语音通过官方 WebSocket 调用 `qwen-audio-3.0-tts-plus`，默认 `longanlingxin`，支持 MP3/WAV/Opus/PCM 与韵律、语言、指令参数；完整校验后只写入全新目标。

## Qwen 3.8 推理

- `qwen3.8-max` 默认 `xhigh` 且可 `/effort off`；`qwen3.8-max-preview` 始终思考。
- 思考模式温度最低 `0.6`，工具轮次保留 reasoning。

## 实时流式输出

- `--include-partial-messages` 为 `stream-json` 增加逐 Token 的 `stream_event` / `content_block_delta`，默认关闭以保持现有完整消息协议兼容。
- SDK、无头执行与 ACP 复用同一实时事件路径，文本、思考和工具开始事件可在回合完成前送达。

## 安全与计费

- 多媒体请求先过权限门禁；输出拒绝覆盖任何已有目录项；失败后不盲目重发可能已计费的任务。
- `hipmmcode skill add QianWen-AI/qianwen-ai` 可选安装官方技能包；技能脚本使用普通按量付费 `sk-...`，与 Token Plan 原生工具相互独立。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请使用 `SHA256SUMS` 校验。

# HiPMMCode v0.16.2 更新总结

## 阿里千问 Token Plan 与按量付费

- 新增 `qwen-token-plan`（OpenAI 兼容，`qwen-token-plan-openai` 为别名）和 `qwen-token-plan-anthropic`（Anthropic Messages）两条 Token Plan 路径。
- 按量付费通过 `qwen`（OpenAI 兼容）与 `qwen-anthropic`（Anthropic Messages）接入。
- Token Plan 使用 `QWENCLOUD_TOKEN_PLAN_API_KEY`（兼容 `BAILIAN_TOKEN_PLAN_API_KEY` / `QWEN_TOKEN_PLAN_API_KEY`）；按量付费使用 `DASHSCOPE_API_KEY`（兼容 `QWEN_API_KEY`）。两组凭据严格隔离。
- CLI、无头/SDK 与 ACP 使用一致的内置渠道别名，流式响应保留输入、输出、缓存与推理 Token 明细。
- Windows 安装文档补充当前 PowerShell 会话刷新 `PATH` 的命令。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请使用 `SHA256SUMS` 校验。

**平台：** macOS（Apple Silicon / Intel / universal）、Linux（x64 / arm64，musl 静态）、Windows（x64）。下载后请使用 `SHA256SUMS` 校验。

# HiPMMCode v0.16.1 更新总结

## 本次修复

- 长模型/API Key 配置提示换行后可完整清除并重绘，不再重复刷屏。
- Linux 沙箱正确区分隐藏目录、隐藏文件和不存在的过期路径，部署 `.env` 不再导致 bubblewrap 启动失败。
- 仅有文件遮蔽规则时仍强制启用沙箱，继续保持多租户执行 fail-closed。
- 产品、文档、Artifact 与部署引用统一到 `www.hipmmai.com` 和 `hipmmcode` 命名体系。

---

# HiPMMCode v0.11.0 更新总结

## 🎉 本次更新内容

### ✅ 已完成功能

#### 1. **Artifact 发布增强**

**直接发布 HTML 文件**
```bash
hipmmcode publish --file mypage.html --public --title "我的页面"
```

**模板系统（3种模板）**
- `morning-brief` - 每日简报，统计卡片 + 任务列表
- `plan` - 技术文档，清晰排版 + 代码高亮
- `dataviz` - 数据可视化，数据卡片 + 表格

```bash
hipmmcode publish --file report.md --template morning-brief --public
hipmmcode publish --file design.md --template plan --public
hipmmcode publish --file analytics.md --template dataviz --public
```

#### 2. **Thinking 泄漏修复** ✅

**问题**: Extended thinking 的推理过程（`****Confirming****`）被显示出来

**修复**: 添加 `showThinking` 配置，默认隐藏推理过程

```bash
# 默认行为：thinking 隐藏
hipmmcode chat "你的问题"

# 如需调试，启用 thinking 显示
hipmmcode config set showThinking=true

# 关闭 thinking
hipmmcode config set showThinking=false
```

#### 3. **命令增强**

新增参数：
- `--file PATH` - 指定要发布的文件（HTML 或 Markdown）
- `--template NAME` - 使用模板（morning-brief | plan | dataviz）

```bash
# 完整命令示例
hipmmcode publish \
  --file report.md \
  --template morning-brief \
  --public \
  --discoverable \
  --title "2025年度工作简报"
```

### ⚠️ 待解决问题

#### 模型路由错误

**问题描述**: GPT-5.6 被错误路由到 `http://159.195.15.175:8080` (Anthropic 渠道)，而不是 `openai-codex`

**临时解决方案**:
```bash
# 方法 1: 显式指定 provider
hipmmcode chat --provider openai-codex "你的问题"

# 方法 2: 使用其他 GPT 渠道
hipmmcode config set defaultProvider=gpt-proxy-native
```

**需要的调试信息**:
```bash
# 运行以下命令收集日志
RUST_LOG=sc_providers=debug hipmmcode chat '测试' 2>&1 | tee routing-debug.log

# 查看可用模型
hipmmcode model list --provider openai-codex

# 运行诊断脚本
bash debug-routing.sh
```

---

## 📁 新增文件

### 模板文件
- `crates/sc-ui/templates/morning-brief.html` - 每日简报模板
- `crates/sc-ui/templates/plan.html` - 技术文档模板
- `crates/sc-ui/templates/dataviz.html` - 数据可视化模板

### 模块文件
- `crates/sc-ui/src/artifact_templates.rs` - 模板渲染引擎

### 测试文件
- `test-artifact.html` - HTML 示例
- `test-morning-brief.md` - Markdown 示例
- `test-model-routing.sh` - 路由诊断脚本
- `debug-routing.sh` - 深度调试脚本

### 文档
- `ARTIFACT_FEATURES.md` - 功能详细说明
- `ARTIFACT_USAGE.md` - 使用指南
- `BUG_FIXES.md` - 问题修复报告
- `RELEASE_NOTES.md` - 本文档

---

## 🔧 代码修改

### 核心修改
1. `sc-core/src/config.rs` - 添加 `show_thinking` 配置项
2. `sc-ui/src/repl.rs` - 修改 thinking 显示逻辑，集成模板系统
3. `sc-ui/src/commands/mod.rs` - 添加 `--file` 和 `--template` 参数
4. `sc-ui/src/lib.rs` - 注册 `artifact_templates` 模块

### 功能增强
- HTML 文件自动检测（`.html` / `.htm`）
- Markdown 自动转换（`.md` / `.markdown`）
- 模板变量自动填充（`{{TITLE}}`, `{{DATE}}`, `{{CONTENT}}`）
- Mermaid 图表支持（在所有模板中）

---

## 🚀 快速开始

### 安装新版本
```bash
# 已自动安装到 ~/.cargo/bin/hipmmcode
hipmmcode --version  # 应显示 0.11.0
```

### 测试新功能

#### 1. 测试 Thinking 修复
```bash
# 默认：thinking 隐藏
hipmmcode chat "写一个排序算法"

# 看不到 ∴ Thinking… 内容 ✅
```

#### 2. 测试 HTML 发布
```bash
hipmmcode publish --file test-artifact.html --public --title "HiPMMCode 介绍"
# 获得分享链接
```

#### 3. 测试模板系统
```bash
# Morning Brief 模板
hipmmcode publish \
  --file test-morning-brief.md \
  --template morning-brief \
  --public \
  --title "今日工作简报"

# Plan 模板
echo "# 系统设计

## 架构
采用微服务架构...

## 技术栈
- Rust
- PostgreSQL" > design.md

hipmmcode publish --file design.md --template plan --public
```

---

## 📊 性能与兼容性

### 编译信息
- **编译时间**: ~2分钟（release 模式）
- **二进制大小**: ~50MB
- **平台**: macOS (darwin)
- **警告数**: 3个（不影响功能）

### 兼容性
- ✅ 向后兼容旧版配置
- ✅ 保持现有命令行为
- ✅ 新功能通过可选参数启用
- ✅ 默认行为更加合理（thinking 隐藏）

---

## 🎨 模板预览

### Morning Brief
- 统计卡片布局
- 彩色任务列表
- 响应式设计
- 自动深色模式

### Plan
- 专业文档排版
- 代码语法高亮
- 章节目录导航
- 清晰的层级结构

### DataViz
- 数据卡片展示
- 表格优化显示
- 渐变色彩主题
- 鼠标悬停效果

---

## 📝 使用建议

### 最佳实践

1. **日常简报**
```bash
# 每天结束时发布工作总结
hipmmcode publish --file daily-$(date +%Y%m%d).md --template morning-brief --public
```

2. **技术文档**
```bash
# 设计文档、RFC
hipmmcode publish --file RFC-001.md --template plan --public
```

3. **数据报告**
```bash
# 分析报告、指标展示
hipmmcode publish --file metrics.md --template dataviz --public
```

### 配置建议
```json
{
  "showThinking": false,
  "artifactHost": {
    "origin": "https://www.hipmmai.com",
    "apiKey": "your-api-key",
    "public": false
  }
}
```

---

## 🐛 已知问题

1. **模型路由错误** - GPT 模型可能被路由到错误渠道
   - 临时方案：使用 `--provider openai-codex`
   
2. **警告信息** - 编译时有 3 个警告
   - 不影响功能，可忽略

---

## 📞 反馈与支持

### 问题报告
如遇到问题，请提供：
1. 完整的命令行输入
2. 错误截图
3. `hipmmcode doctor` 输出
4. 日志文件（如有）

### 调试工具
```bash
# 路由问题诊断
bash test-model-routing.sh
bash debug-routing.sh

# 详细日志
RUST_LOG=debug hipmmcode chat "测试" 2>&1 | tee debug.log
```

---

## 🎯 下一步计划

1. ✅ 修复 thinking 泄漏 - 已完成
2. 🔄 修复模型路由问题 - 调查中
3. 📝 添加更多模板 - 计划中
4. 🎨 模板自定义功能 - 未来版本

---

## 📚 相关文档

- [功能详解](./ARTIFACT_FEATURES.md) - 详细功能说明
- [使用指南](./ARTIFACT_USAGE.md) - 完整使用教程
- [问题修复](./BUG_FIXES.md) - 技术细节和修复过程

---

**版本**: v0.11.0  
**发布日期**: 2025-01-19  
**开发者**: HiPMMCode Team  
**协助**: Claude (Kiro)

🌟 感谢使用 HiPMMCode！
