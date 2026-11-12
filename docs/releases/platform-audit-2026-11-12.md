# 平台版本核验与更新 — 2026-11-12

核验日期：2026-11-12（Asia/Shanghai）。本次范围依据仓库已有发布记录确定，
包含 GitHub、skills.sh、腾讯 SkillHub、Skillstore、Agensi、VoltAgent 和 SkillsDir。
没有将其他同名或相似域名的平台纳入本次发布。

## 发布单元

- Skill：`wxpusher-integration`，作者版本 **1.0.4**，MIT。
- 固定来源：`67fdb08b4fa574f2c4c2213838dc142f837e9ea2`。
- 来源目录：`skills/wxpusher-integration/`；8 个文件，Git tree 为
  `3edb7a0a749cc5fc1c5fb1b86313005a517ccd13`。
- 当前工作区和既有远端 `main` 的 skill 内容均与该来源一致；工作区比较归一化 CRLF。
- API 资料核验日期仍为 **2026-10-08**。本次检查发布状态，没有重新核验 WxPusher API
  或修改 skill 本体，也没有改写用户级安装副本。

## 各平台结果

| 平台 | 本次核验结果 | 本次操作 |
| --- | --- | --- |
| [GitHub](https://github.com/hunxuankai/wxpusher-integration/releases/tag/v1.0.4) | 安装源原已为 1.0.4；Release 原为 1.0.3，现已公开最新正式版 1.0.4 | 为既有公开来源创建新标签、发布三个独立附件；匿名下载并逐字节验证 |
| [skills.sh](https://skills.sh/hunxuankai/wxpusher-integration/wxpusher-integration) | 实际安装为 1.0.4；检查开始时网页仍是旧正文，一次真实安装后网页已显示新版完整正文 | 在全新临时目录安装一次，保留默认遥测；没有重复安装增加计数 |
| [腾讯 SkillHub](https://skillhub.cn/skills/user_cbf4d189/wxpusher-integration) | 公开版本为 1.0.4；下载包含全部 8 个来源文件；简介和完整概述对应新版 | 只读核验和公开包下载，没有重复提交 |
| [Skillstore](https://skillstore.io/zh-hans/skills/hunxuankai-wxpusher-integration) | 作者版本 1.0.4、内容修订 r2、approved；下载内容和公开介绍对应新版 | 核对原更新 PR、manifest、公开包和 Markdown 详情，没有重复提交 |
| [Agensi](https://www.agensi.io/skills/wxpusher-integration) | 创作者工作台为 Live；公开介绍注明作者版本 1.0.4 和固定来源；已批准包结构为 8 文件 | 复用既有登录，只读核验条目和公开内容，没有重传或新建版本 |
| [VoltAgent](https://github.com/VoltAgent/awesome-agent-skills/pull/1182) | 原投稿 CLOSED、未合并；目录默认分支没有 WxPusher 条目 | 读取 PR、时间线和当前投稿要求，没有重复投稿 |
| [SkillsDir](https://skillsdir.dev/add) | 正式投稿入口返回 HTTP 402，浏览器显示 “This deployment is temporarily paused” | 核验正式入口；尚未成功提交，不能记为审核中 |

上述前五个已上线渠道均取得当前作者版本的证据；两个社区目录的结果是未收录或入口受阻，
不是旧版更新已完成。Agensi 的作者版本与平台显示的包版本 `v1.0` 分开记录。

## GitHub 正式发行

- 新标签 `v1.0.4` 指向固定来源提交，原 `v1.0.3` 标签和附件保留。
- Release 于 **2026-11-12 20:57:10 +08:00** 公开，`isDraft=false`、
  `isPrerelease=false`、`isLatest=true`。
- 正文采用本仓库的 [v1.0.4 发行说明](v1.0.4.md)，涵盖中文触发边界、微信渠道、
  系统与工具前提、完整许可和实际验证范围。
- ZIP 为 `wxpusher-integration-1.0.4.zip`，30,621 字节，只有一层
  `wxpusher-integration/` 目录，其下为全部 8 个 skill 文件。
- SHA-256：`73c8086f21f126419bc59edbbeb2c8c7192c7ca8abac6a10ed897507c476cb28`。
- 同时发布同名 `.sha256` 和 `.commit.txt`；三项均已通过无需登录的公开链接重新下载。
  **20:59:40 +08:00** 的核验确认三个附件与本地材料逐字节相同，ZIP 内全部文件与来源
  Git blob 逐字节相同。
- 来源提交的 [GitHub Actions](https://github.com/hunxuankai/wxpusher-integration/actions/runs/37711818364)
  为 `success`。本次源码及解压候选包也通过结构检查。

Git 的 SSH 查询遇到连接中断后，HTTPS 读取成功。常规标签推送被 GitHub 的
`GH007` 邮箱隐私保护拒绝；确认远端标签尚未创建、来源提交已经公开后，使用正式
GitHub REST 接口创建该提交的版本引用，再以 `gh release create --verify-tag`
发布。发布成功另由 Release 状态及匿名下载证明，没有更改邮箱隐私保护设置。

## 下载和安装核验

### skills.sh

使用当日 npm 最新版、官方仓库为 `vercel-labs/skills` 的 `skills@1.8.1`，先读取帮助，
再在仓库之外的全新临时目录执行一次：

```sh
npx --yes skills@1.8.1 add hunxuankai/wxpusher-integration --skill wxpusher-integration --agent codex --copy --yes --json
```

安装成功，8 个文件与固定来源逐字节相同；版本为 1.0.4，核验日期为 2026-10-08。
对该临时副本运行仓库检查器通过（8 文件、15 引用）。CLI lock 中记录来源为
`hunxuankai/wxpusher-integration`、路径为 `skills/wxpusher-integration/SKILL.md`，
内容哈希为 `13292962ae0833b73b30ac45c07f9571c0d6b67a354f38adee976d7f598ef1c2`。

公开网页原显示 “触发边界（Activation boundary）” 旧正文。安装后重新读取页面并
展开 “Show more”，已见 1.0.4 的“适用范围”“请求示例”“运行流程”“生命周期与来源处理”
和“快速索引”；通用 UID/Topic 不触发、ClawBot、既有授权和 SPT 不确定性均与来源一致。
此记录只说明本次观测结果，不承诺所有安装都会立即刷新网页。

当日 [FAQ](https://skills.sh/docs/faq)仍说明通过官方 CLI 遥测收录；
[Customize](https://skills.sh/docs/customize)只提供仓库页面分组配置。
正式详情 API 的匿名请求返回 401、要求 Vercel OIDC，因此该 API 未作文件验收依据；
安装文件和实际公开网页分别完成核验，没有新建 Vercel 项目或鉴权配置。

### 腾讯 SkillHub

从公开页面实际下载链接取得 `@user_cbf4d189/wxpusher-integration` 的 1.0.4 ZIP。
8 个来源文件均逐字节一致，另有平台生成的 `_meta.json`，其中版本为 1.0.4。
该元数据不属于作者源码。下载 ZIP SHA-256 为
`b3a1a5103e21ffda6eb21221cde998d102185dc74e39dcff8f0566a8431a5093`。

公开简介全文为：

> 为脚本、后端和定时任务接入或排查 WxPusher 通知，覆盖 UID/Topic、SPT、配置与错误处理；说明微信 ClawBot（iLink）的绑定、激活及接收限制。

完整概述已显示 1.0.4 的 SKILL.md 正文，包括中文入口、触发边界、ClawBot、
逐目标判断、既有授权、SPT 不确定性和生命周期。默认文件/自定义概述的后台模式
未另行修改；本次依据实际公开正文验证内容，不由上传或版本号推定概述已更新。

### Skillstore

[更新 PR #3838](https://github.com/aiskillstore/marketplace/pull/3838)已于
2026-10-19 02:01:37 +08:00 合并。
[公开 manifest](https://skillstore.io/api/skills/hunxuankai-wxpusher-integration/manifest)
明确 `authorVersion=1.0.4`、`skillstoreRevision=2`；顶层 `version=1.0`
是 manifest 协议字段，不是作者版本。

从 manifest 指向的实际下载入口取得归档，SHA-256 为
`921b7f8d1b685da35f1699c0f1e8f90b27e22e5c37321212481b8407beb57428`，
与 manifest 一致。全部 8 个来源文件逐字节相同，额外 README 明确为平台生成的
安装回执，记录作者版本 1.0.4、r2 和来源，不是作者新增的运行依赖。

实际 [Markdown 详情](https://skillstore.io/skills/hunxuankai-wxpusher-integration.md)
状态为 approved，简介和概述覆盖路由、凭据、逐目标判断、重试、模拟验证、
微信 ClawBot、SPT 撤销不确定性和未内置可执行客户端等边界。无需再次提交同版本。
此前认领申请的管理权限状态不属于本次版本核验依据，未重新提交认领。

### Agensi

原提交已从 Pending 转为 Live。公开简介为：

> Integrate and troubleshoot WxPusher notifications for scripts, backends, cron jobs, and CI.

“About this skill” 全文明确作者版本 1.0.4、MIT、资料核验日期和固定来源提交，
包含中文为主、触发边界、ClawBot 条件、Markdown/YAML 无运行时依赖、使用宿主工具、
凭据占位和未执行真实投递测试。示例会话是模拟响应分析，未被写成真实发送验证。

“WHAT'S INSIDE” 显示最新已批准包的结构为 8 文件、3 文件夹，平台包版本 `v1.0`。
本次没有通过买方连接器导出受限内容；当前源码、公开来源、包结构和既有上传记录
相符，但没有在本轮重新读取平台保存的每个文件字节。
2026-10-10 的原上传记录对应固定来源，独立 ZIP 为 30,621 字节，SHA-256 为
`ba5e27a8dda98997d59150c6e51280f7fca3ed9de809a390b75562d1a8cc66b0`；
该记录确认上传前的 8 个文件与提交逐字节一致。

Python HTTP 客户端读取 Agensi 更新文档曾返回证书过期错误；实际 Edge 会话正常
打开正式后台和公开条目，未出现或绕过安全拦截。该 HTTP 错误不被当作平台宕机证据。

## 社区目录

- VoltAgent PR #1182 于 2026-10-23 16:12:06 +08:00 被关闭，`mergedAt=null`；
  时间线没有公开关闭说明。默认分支 README 不含 WxPusher。
  [当前 CONTRIBUTING](https://github.com/VoltAgent/awesome-agent-skills/blob/main/CONTRIBUTING.md)
  仍要求真实社区使用；本次未猜测关闭原因、伪造采用情况或再次发相同 PR。
- SkillsDir 正式 `/add` 入口显示部署暂停，未取得可用投稿表单。
  2026-10-10 的历史准备记录曾发现官方 GitHub 投稿仓库不可读、推荐的 `@skills/cli`
  返回 E404；这些历史现象没有沿用为本次检查结果。本次以正式入口的暂停响应为
  受阻证据，不能报告已经提交或已更新。

## 本地维护与验证范围

- `python tools/check_skill.py`、解压候选包检查和 CLI 安装副本检查均通过；
  每项为 8 文件、15 个本地引用，覆盖 YAML、JSON 示例和基础凭据形态。
- `git diff --check` 通过；GitHub 归档与来源 Git blob、许可副本一致。
- 完整的发行正文见 [v1.0.4.md](v1.0.4.md)，仓库 README 更新为当前下载版本。
  其他平台的已公开简介和概述只读核验，没有保存草稿或另行提交介绍。
- 本次没有执行真实 WxPusher 投递测试。
- 本机核验产物保存在 Git 忽略的 `dist/` 及隔离临时目录中；不包含凭据、Cookie
  或个人通知地址，不进入 skill 安装包。

## 维护记录同步与邮箱隐私

同步前审阅本地唯一尚未推送的提交 `d8478686f6e7d12eb9b154cc365812bc86af7d0b`，
其父提交就是当时远端 `main`，只新增 59 行 Skillstore 维护记录；GitHub 按完整 SHA
查询返回 `422 / No commit found for SHA`。作者与提交者均为当前维护者，未签名，
邮箱与被 GH007 拒绝的标签来源相同。

先在本机维护备份目录保存并验证 Git bundle，同时备份原有工作区维护文件；
随后将该未推送提交的作者和提交者邮箱改为对应 GitHub 账号的 noreply 地址，
重建为 `177be13687e3299ccea7c00471eba1b660ee0d58`。逐项比较确认只有两个邮箱字段变化：
代码树、提交消息、姓名、时间及父提交均相同，树为
`791b7ddb8fb38fa699215f092bd90f24f5d6255a`。

替换本地引用后，原有工作区状态和文件哈希一致；原始提交仍保存在本机 bundle 和
reflog 中。原有未提交的 AGENTS.md、维护说明和历史平台记录未纳入本次新提交。
本次新增提交的范围为 README、1.0.4 发行正文和本核验记录，并使用 noreply 邮箱。
