# wxpusher-integration

用于接入和排查 WxPusher 通知的 Agent Skill，覆盖标准推送、UID/Topic、SPT、响应判断、配置和故障处理。

这是作者维护仓库；当前 skill 版本为 **1.0.2**，API 资料最近核验于 **2026-10-06**。
本次仓库整理保留已有 skill 内容，不代表重新核验了线上 API。

## 目录

```text
AGENTS.md                      给维护代理的工作约定
README.md                      项目介绍和本地维护入口
requirements-dev.txt           仅维护工具使用的依赖
docs/maintenance.md            维护、检索验证和发布流程
tools/check_skill.py           离线结构检查
tools/install-local.ps1        检查、备份并同步到本机安装目录
skills/wxpusher-integration/   唯一 skill 源码，也是安装内容的根目录
  SKILL.md
  references/
  agents/openai.yaml
```

## 使用 skill

完整内容见 [SKILL.md](skills/wxpusher-integration/SKILL.md)。
将整个 `skills/wxpusher-integration/` 文件夹安装到宿主支持的技能目录。
Codex 的用户级目录可使用 `~/.agents/skills/wxpusher-integration/`。

例如向代理提出：

> 使用 wxpusher-integration，为现有脚本接入 WxPusher 通知；缺少凭据时使用环境变量占位，先完成离线验证。

公开示例只使用占位符；真实凭据通过使用者自己的配置方式提供。
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

## 公开发布

- 该仓库维护一个 skill；向平台填写源码子目录时使用 `skills/wxpusher-integration`。
- SkillHub、SkillStore 等平台的提交方式、目录结构和元数据要求需要分别核实；目前未执行平台发布验证。
- **许可证尚未选定。** 正式公开分发前由作者确定许可，并添加相应 `LICENSE` 文件；本仓库没有预设开源授权。
- 本项目由作者独立维护，不是 WxPusher 官方项目。官方 API 文档见 <https://wxpusher.zjiecode.com/docs/>。
