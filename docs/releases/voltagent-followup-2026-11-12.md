# VoltAgent 关闭原因询问与 SkillHub 证据补充

日期：2026-11-12（Asia/Shanghai）。按用户要求，在原 PR 询问关闭原因，
并请维护者确认腾讯 SkillHub 的公开下载数据是否可作为社区使用证据支持复审。

## 来源和公开数据

- 原 PR：<https://github.com/VoltAgent/awesome-agent-skills/pull/1182>。
- Skill：`wxpusher-integration`，作者版本 1.0.4，MIT；固定来源提交
  `67fdb08b4fa574f2c4c2213838dc142f837e9ea2`。
- 腾讯 SkillHub 条目：<https://skillhub.cn/skills/user_cbf4d189/wxpusher-integration>，
  身份为 `@user_cbf4d189/wxpusher-integration`。
- 2026-11-12 **21:27:08 +08:00** 匿名读取公开页面，HTTP 200；当前作者版本为
  **1.0.4**，页面指标“次下载”为 **92**。
- 这是条目的平台汇总下载数；独立外部用户数、按版本统计、重复下载规则及成功
  集成使用均未核实，可能包含维护者验证下载。没有为采集该指标再次下载安装包。

[当前 CONTRIBUTING](https://github.com/VoltAgent/awesome-agent-skills/blob/main/CONTRIBUTING.md)
要求真实社区使用，没有限定证据必须来自 GitHub 或 skills.sh，也没有列出具体数量门槛。
因此腾讯 SkillHub 数据可作为补充材料提交给维护者，是否足以满足收录标准仍需其判断。
原 PR 的具体关闭原因仍未得到说明，不能预先断定就是使用证据不足。

## 已发布的留言

- 留言：<https://github.com/VoltAgent/awesome-agent-skills/pull/1182#issuecomment-6824958192>。
- GitHub comment ID：`6824958192`；发布账号：`hunxuankai`。
- 发布于 **2026-11-12 21:29:42 +08:00**。
- 使用 `gh pr comment --body-file` 发送；随后通过正式评论 API 重新读取，核对 ID、
  作者和完整正文与准备的文案一致。原 PR 的评论列表也已显示该留言。

完整正文：

```markdown
Hi @necatiozmen, could you clarify why this PR was closed and what would be needed for reconsideration?

If the concern is community usage, would publicly visible downloads on Tencent SkillHub count as supporting evidence? The public listing for this skill currently shows author version **1.0.4** and **92 downloads**, checked on **2026-11-12 at 21:27 UTC+8**:

https://skillhub.cn/skills/user_cbf4d189/wxpusher-integration

These are aggregate platform downloads. I have not verified unique external users, per-version totals, or successful integrations; the count may include repeat downloads and maintainer verification downloads.

Would this evidence be sufficient to reconsider this PR, or would you need concrete external-project references or user feedback? If the closure was for another reason, please let me know what should be addressed.

Thanks for your guidance.
```

## 当前结果与后续

留言后核验：原 PR 仍为 `CLOSED`、`mergedAt=null`，评论列表只有本次询问，
尚未看到维护者回复。没有因补充数据自动重开 PR 或创建重复投稿。

后续以维护者的实际回复为准：确认关闭原因、是否接受腾讯 SkillHub 指标、是否需要
真实外部项目或用户反馈，以及复审原 PR 或新投稿的具体要求。下载量只作为辅助证据，
不据此宣称已满足社区采用要求或已经获准收录。

本次只新增维护记录，没有改动 skill 本体、版本、API 核验日期或本机安装副本。
公开留言只含相关项目资料和平台汇总指标，不包含凭据、私人通知地址或用户明细。
