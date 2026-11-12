# 1.0.5 平台发布与核验

日期：2026-11-12（Asia/Shanghai）。按用户发布授权处理仓库已有的七个渠道：
GitHub、skills.sh、腾讯 SkillHub、Skillstore、Agensi、VoltAgent 和 SkillsDir。
本次不增加新的平台账号、付费方式或许可证选择。

## 固定来源与发布包

- Skill：`wxpusher-integration`，作者版本 **1.0.5**，MIT。
- 固定来源：`634107ef4e5c27ad817356c6c1bc1c599f86f075`，目录 `skills/wxpusher-integration/`。
- ZIP：`wxpusher-integration-1.0.5.zip`，**34443 字节**，一层 `wxpusher-integration/`，共 8 个源码文件。
- SHA-256：`c3efaf89ee94e58e490f4a56faf24e92d4f05b385727ce09201c73a0d1af4bcb`。
- 同时发布 `.sha256` 和 `.commit.txt`；后者记录上述固定提交。
- 用 Git archive 从已验证提交生成；包内全部文件与 Git blob 逐字节一致。
  不包含维护工具、仓库记录、个人配置或通知凭据。
- 原始源码、解压包和 CLI 安装副本均通过 `python tools/check_skill.py`：
  8 个文件、18 个本地引用；`git diff --check` 与许可证副本检查通过。
- 固定来源的 [GitHub Actions](https://github.com/hunxuankai/wxpusher-integration/actions/runs/43236257023)
  已通过 Ubuntu 和 Windows 两个任务，覆盖结构、许可、空白和隔离安装。
- 此次只发布已维护的内容；API 核验日期、既有版本记录及本机安装内容不刷新或改写。
  本次没有执行真实 WxPusher 投递测试。

## 邮箱隐私与来源提交

发布前发现本次尚未推送的 `4c40dd1ff3e9c673cfaf9c30dd5f3b913a5c6ebb` 仍使用本机普通邮箱。
仓库此前已选择对应 GitHub 账号的 noreply 邮箱；正式 API 查询原 SHA 返回未找到提交，
确认其尚未公开后，先在本机保存并验证 Git bundle 和工作区备份。

仅替换该提交的作者与提交者邮箱，重建为上述 `634107e`。逐项比较确认文件树、父提交、
消息、姓名和时间保持，工作区文件哈希及原有改动保持。新提交使用仓库级 noreply 配置；
未修改账号隐私设置、未重写已公开历史，原提交保留在本机 bundle 与 reflog 中。
本记录不包含实际邮箱或本机私有备份路径。

## 各平台结果

| 平台 | 本次结果 | 当前公开证据与边界 |
| --- | --- | --- |
| [GitHub](https://github.com/hunxuankai/wxpusher-integration/releases/tag/v1.0.5) | 正式发行已公开 | 最新非草稿、非预发行 v1.0.5；三个附件匿名下载与本地材料完全一致，标签指向固定来源。 |
| [skills.sh](https://skills.sh/hunxuankai/wxpusher-integration/wxpusher-integration) | 安装源为 1.0.5，网页正文待刷新 | 一次实际安装的 8 个文件与来源完全一致；最终重新读取并展开正文，仍是旧运行流程，尚无新 POST 端点或编码斜杠限制。 |
| [腾讯 SkillHub](https://skillhub.cn/skills/user_cbf4d189/wxpusher-integration) | 作者版本 1.0.5 已公开 | 简介和默认 SKILL.md 概述均对应新版；匿名下载包含全部 8 个来源文件及平台 `_meta.json`。 |
| [Skillstore](https://skillstore.io/zh-hans/skills/hunxuankai-wxpusher-integration) | 作者版本 1.0.5、r3 已公开 | 更新 PR #4178 已合并；公开 manifest、下载内容和 Markdown 介绍均对应新版。 |
| [Agensi](https://www.agensi.io/skills/wxpusher-integration) | 新介绍已公开，公开包结构标示 v1.1 | 简介、完整概述、示例及 FAQ 已同步作者版本 1.0.5；页面将 v1.1 标为最新已批准包结构，8 文件、3 文件夹。托管文件字节未导出复核。 |
| [VoltAgent](https://github.com/VoltAgent/awesome-agent-skills/pull/1182) | 尚未收录 | 原 PR 仍 CLOSED、未合并；已有复审询问无维护者回复，默认目录无 WxPusher。没有重复创建相同投稿。 |
| [SkillsDir](https://skillsdir.dev/add) | 未提交，正式入口受阻 | HTTP 402、`DEPLOYMENT_DISABLED`；原官方投稿仓库和 CLI 仓库均 404，`@skills/cli` 也返回 404。 |

## 发布包与介绍内容分别验收

完整拟提交文案见 [平台介绍材料](platform-introduction-v1.0.5.md)，发行正文见
[v1.0.5](v1.0.5.md)。介绍明确 SPT JSON POST、原文与 UTF-8、GET 当前支持边界、
证据来源分层、旧查询停用、长期授权和业务码判断；保留中文为主、Markdown/YAML
无运行时依赖及未进行真实投递/全部宿主实机验证的范围。

| 内容层 | 来源及本次处理 | 实际验收 |
| --- | --- | --- |
| 包内 SKILL.md description | 固定来源，保留原触发描述 | 源码/发行包/可下载副本一致；不为平台摘要改写触发边界。 |
| GitHub README 与 Release | README 指向 1.0.5，Release 使用完整发行正文 | main 已推送；v1.0.5 最新正式发行公开，附件核验通过。 |
| 腾讯简介 | 使用介绍材料的中文简介，独立填写更新表单 | 最初安全审核中，后续公开页已显示相同新简介。 |
| 腾讯概述 | 原条目未自定义概述，保持默认 SKILL.md 模式 | 公开全文出现新 POST、原文 JSON、`%2F` 限制与既有授权，符合新源码。 |
| Skillstore 简介/概述 | 提交固定源码 URL 和完整升级说明，由平台处理 | 公开 Markdown 标注作者版 1.0.5，并说明 SPT JSON POST 与原文保留；8 个作者文件完整一致。 |
| Agensi 简介/概述 | 分别填入英文摘要和概述全文 | 提交前输入值与材料一致，公开正文包含 1.0.5、固定来源、SPT/GET 限制、依赖和验证边界。 |
| Agensi 示例、限制和 FAQ | 更新模拟请求/响应、日期、作者版本和旧查询说明 | 公开示例包含完整原文 JSON 与业务失败判断，明确没有执行真实请求。 |
| skills.sh 正文 | 平台快照，安装遥测与文件来源分别处理 | 安装为 1.0.5，公开正文仍旧，记录为未完成项，不由安装成功推断网页更新。 |

## 分平台执行证据

### GitHub

- main 已推送验证源码及发行材料；新标签 v1.0.5 直接指向固定来源。
- Release 于 **22:25:10 +08:00** 公开，`draft=false`、`prerelease=false`，最新发行也是 v1.0.5。
- 用 `gh release create --verify-tag --notes-file` 创建，未覆盖 v1.0.3/v1.0.4。
- 三个公开附件均使用不带 GitHub Authorization 的 HTTP 请求重新下载，逐字节匹配。

### skills.sh

当前 npm 最新 `skills@1.8.1` 的仓库为 `vercel-labs/skills`。读取帮助后在仓库和
用户级安装目录之外，仅执行一次项目级安装：

```sh
npx --yes skills@1.8.1 add hunxuankai/wxpusher-integration --skill wxpusher-integration --agent codex --copy --yes --json
```

安装结果为一个 skill，project/copy 模式，8 个文件与固定来源一致。保留默认遥测，
没有通过重复安装、换名或模拟其他用户增加计数，也没有覆盖用户级副本。
官方 FAQ 仍说明 CLI 安装遥测触发收录；API 文档列出的接口为读取，未提供公开
手动刷新正文的入口。API 的五分钟详情缓存不是网页快照刷新保证；不创建新的
Vercel 项目或 OIDC 配置来试探恢复。网页具体更新时间仍待平台更新后再核验。

### 腾讯 SkillHub

复用既有登录，从“我的 Skills → 更新”上传同一个独立 ZIP。预览为 8 个文件、
63.7 KB，身份、显示名、分类、图标及默认概述模式保持；填写作者版本 1.0.5、
新版中文简介与变更说明后正式提交。

随后公开页出现 v1.0.5、新简介和完整新正文。匿名下载包 SHA-256 为
`aac28dc89f0628df20fd0410e52f33458100579cc5152a86eec62146508dd6d3`；全部作者文件
与来源逐字节一致，额外 `_meta.json` 的版本为 1.0.5，属于平台生成内容。

### Skillstore

- 提交 ID：`5d1d9ff4-c5d0-4993-aedf-9c0705870317`，**22:40:16 +08:00** 提交，预计发现 1 个 skill。
- [状态页](https://skillstore.io/zh-hans/submissions/5d1d9ff4-c5d0-4993-aedf-9c0705870317)。
- [处理工作流](https://github.com/aiskillstore/marketplace/actions/runs/43239620069)成功。
- [更新 PR #4178](https://github.com/aiskillstore/marketplace/pull/4178)最初 OPEN、pending-review，
  待审 8 文件与作者来源一致；于 **22:58:23 +08:00** 合并。
- 公开 manifest 为作者版本 1.0.5、`skillstoreRevision=3`；顶层 `version=1.0` 是协议版本。
- 公开 ZIP SHA-256 为 `a8df54223c8236ef013b93c12134234bf9e887519822c8f3f8ebb0cb4d34c6fc`，
  与 manifest 一致。8 个作者文件完全一致，额外 README 是平台生成的安装回执。
- 使用网站正式入口，未手工开内容库 PR，未额外启用 GitHub 通知授权或重复认领。

### Agensi

从既有免费条目编辑页替换 ZIP，平台找到根 SKILL.md。普通文件控件触发失败后，
使用可见上传区域成功选择同一验证包；没有更改浏览器安全设置或重复上传新版本。

作者版 1.0.5 与平台建议的新包版本 **1.1** 分别处理。修改简介、完整概述、演示、
限制、FAQ 和 changelog，核对后完成最终 Submit for review。价格和原有分类保持。
公开页面随后显示新介绍及最新已批准包结构 v1.1、8 文件/3 文件夹。

原编辑入口的版本历史仍只列初始 v1.0，此历史展示没有用作最新版依据，未猜测
其同步机制。最新版依据是公开页的包结构字段和本次上传/介绍提交记录。
未通过买方连接器导出受限内容；上传前文件完整核验，平台存储字节没有另外导出比对。

### 社区目录

VoltAgent 仍要求真实社区使用。原 PR 没有公开关闭说明，已有询问未获回复；
本次重新读取 CONTRIBUTING、PR 和默认 README，没有虚构采用证据、猜测关闭原因
或重复创建同一 PR。后续以维护者的复审回复为依据。

SkillsDir `/add` 为部署禁用；本次另核对原官方 GitHub 投稿/CLI 仓库及 npm 包，
均不可用。没有安装未知替代客户端或将未提交写为审核中。

## 收尾

发布材料和本记录在 main 提交并同步远端；原有未提交的仓库约定、维护段落及四份
历史平台文件保留，不混入本次提交。全程没有新增开发分支，本机默认仍只有 main。
发布后仍需观察 skills.sh 正文刷新、VoltAgent 复审和 SkillsDir 投稿入口恢复。
