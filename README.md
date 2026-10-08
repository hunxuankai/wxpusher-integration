# wxpusher-integration

用于接入和排查 WxPusher 通知的 Agent Skill，覆盖标准推送、UID/Topic、SPT、响应判断、配置和故障处理。

当前源码版本为 **1.0.4**，采用 [MIT 许可证](LICENSE)。API 资料最近核验于 **2026-10-08**。
本次更新优化触发与中文入口，并补齐官方微信渠道说明；1.0.4 尚未发布，下方已有发行包仍为 1.0.3。

源码仓库：<https://github.com/hunxuankai/wxpusher-integration>。
本项目独立维护，不是 WxPusher 官方项目。

## 适用范围

- 为脚本、后端服务、定时任务和 CI 接入已选定的 WxPusher 通知渠道。
- 处理标准推送、UID/Topic、SPT、响应判断、凭据配置和故障排查。
- 用户只说“加微信通知”、尚未选择服务商时，不自动选用 WxPusher。
- 普通 UID 查询、Kafka Topic 等通用术语不会单独触发本 skill。

## 是否支持微信推送

**支持，官方当前明确支持微信 ClawBot（iLink）文本通知。** 用户需在 WxPusher App
“我的 → 推送渠道”绑定并启用微信 ClawBot，在微信侧激活后接收；每次激活后
24 小时内最多接收 10 条，用尽后需回复任意内容再次激活。该渠道当前不支持上行消息。

开发者仍使用原有发送 API；官方当前主推独立手机/桌面客户端，微信是补充渠道。
不能将此能力理解为可以向任意微信好友或微信群发送消息。详见
[官方正文](https://wxpusher.zjiecode.com/docs/README.md)及
[接收渠道与微信支持](skills/wxpusher-integration/references/api.md#接收渠道与微信支持)。

Skill 本体由 Markdown/YAML 文件组成，没有 Python、Node.js 或 PowerShell 运行时依赖。
执行集成时使用代理宿主已有的文件、HTTP 和开发工具；真实发送需要使用者自己的 WxPusher 配置。

## 安装

### 通过 skills.sh 安装

已收录于 [skills.sh](https://skills.sh/hunxuankai/wxpusher-integration/wxpusher-integration)：

```sh
npx skills add hunxuankai/wxpusher-integration --skill wxpusher-integration
```

CLI 会从公开 GitHub 仓库发现 `skills/wxpusher-integration/`，并按选择的宿主安装。
该命令跟随仓库当前内容；需要固定 v1.0.3 时，使用下方发行包。

### 下载发行包

在 [Releases](https://github.com/hunxuankai/wxpusher-integration/releases) 下载
`wxpusher-integration-1.0.3.zip`，并可用同名 `.sha256` 文件核对校验值。
解压后，将其中完整的 `wxpusher-integration` 文件夹放入宿主支持的 skills 目录。

Codex 的用户级安装结果应为：

```text
~/.agents/skills/wxpusher-integration/
  SKILL.md
  LICENSE.md
  references/
  agents/openai.yaml
```

Windows 中 `~` 指当前用户主目录。已有同名目录时，先将旧目录移到技能发现目录之外备份，
再安装完整的新目录，避免留下旧文件或同时发现两个副本。安装后若未显示，重启 Codex 会话。

### 从源码安装

```sh
git clone https://github.com/hunxuankai/wxpusher-integration.git
cd wxpusher-integration
```

手动安装时，只需复制 `skills/wxpusher-integration/` 整个文件夹；不要把维护仓库根目录当作 skill 安装。
需要自动校验、备份和同步时，可使用下方的本地维护命令。
其他支持 Agent Skills 的宿主按各自的安装目录使用；目前没有逐一验证所有宿主。

## 目录

```text
AGENTS.md                      给维护代理的工作约定
LICENSE                        仓库 MIT 许可文本
README.md                      安装、使用和维护入口
requirements-dev.txt           仅维护工具使用的依赖
docs/maintenance.md            维护、检索验证和发布流程
docs/releases/                 可用于 GitHub Release 的说明
.github/workflows/check.yml    GitHub 自动检查，不自动发布
tools/check_skill.py           离线结构检查
tools/install-local.ps1        检查、备份并同步到本机安装目录
skills/wxpusher-integration/   唯一 skill 源码，也是安装内容的根目录
  SKILL.md
  LICENSE.md                   随独立安装包分发的完整许可文本
  references/
  agents/openai.yaml
```

## 使用 skill

完整内容见 [SKILL.md](skills/wxpusher-integration/SKILL.md)。

可以直接向代理提出：

| 需求 | 请求示例 |
| --- | --- |
| 新增通知 | 给 Python 定时任务接入 WxPusher，失败时通知我；缺少凭据时使用环境变量占位，先做离线验证。 |
| 微信收不到 | 排查 WxPusher 返回成功但微信没有收到消息的问题。 |
| 个人脚本 | 使用已有的 WxPusher SPT 配置接入个人脚本通知。 |

需要明确指定 skill 时，可以在请求前加“使用 wxpusher-integration”。

公开示例只使用占位符；真实凭据通过使用者自己的配置方式提供。
开发验证默认不发送真实消息；正式运行遵循使用者已有的明确授权。
`agents/openai.yaml` 是可选的宿主 UI 元数据，核心流程在 `SKILL.md` 和 references 中。

## 本地维护

在本仓库根目录打开 Codex。维护工具需要 Python 3.10+；本地同步脚本需要 PowerShell 7。

```powershell
python -m pip install -r requirements-dev.txt
python tools/check_skill.py
git diff --check
./tools/install-local.ps1 -DryRun
./tools/install-local.ps1
```

安装脚本默认同步到当前用户的 `~/.agents/skills/wxpusher-integration/`。
内容相同时不会改写；有变化时先备份到本机应用数据目录的 `SkillBackups/`。
首次安装和更新都只复制 skill 本体，不复制维护工具、Git 数据或本机配置。

自定义宿主的技能父目录时使用 `-SkillsRoot`，参数不是具体 skill 文件夹：

```powershell
./tools/install-local.ps1 -SkillsRoot '<宿主的 skills 父目录>' -DryRun
```

结构检查会验证 YAML、名称、版本格式、相对引用、JSON 示例及部分明显的凭据形状；
它不证明 API 正确，也不能代替完整敏感信息审查。更多步骤见[维护说明](docs/maintenance.md)。
GitHub Actions 在 Linux 和 Windows 上运行结构检查、许可副本一致性检查及临时目录安装验证；
工作流只读取仓库，不配置推送凭据，也不自动创建 Release。

## 公开发布

- 该仓库维护一个 skill；向平台填写源码子目录时使用 `skills/wxpusher-integration`。
- skills.sh 已完成收录和 CLI 安装验证，见 [v1.0.3 收录记录](docs/releases/skills-sh-v1.0.3.md)。
  其他平台的提交方式、目录结构和元数据要求需要分别核实，不能由此推定。
- 仓库和独立 skill 包采用 MIT，版权署名为 `Copyright (c) 2026 WxPusher`。
  分发时保留完整许可文本；根目录 `LICENSE` 与 skill 内 `LICENSE.md` 保持一致。
- [v1.0.3 发行说明](docs/releases/v1.0.3.md)可用作 GitHub Release 正文；提交、打包和发布步骤见[维护说明](docs/maintenance.md#github-发行步骤)。
- 本项目由作者独立维护，不是 WxPusher 官方项目。官方 API 文档见 <https://wxpusher.zjiecode.com/docs/>。
