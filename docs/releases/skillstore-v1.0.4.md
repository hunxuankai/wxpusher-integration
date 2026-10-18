# Skillstore 认领与更新提交记录 — v1.0.4

- 日期：2026-10-19（Asia/Shanghai）。
- 平台条目：<https://skillstore.io/zh-hans/skills/hunxuankai-wxpusher-integration>。
- 提交前公开版本：作者版本 `1.0.3`，Skillstore 内容修订 `r1`。
- 更新目标：作者版本 `1.0.4`，许可证 MIT。
- 固定来源提交：`67fdb08b4fa574f2c4c2213838dc142f837e9ea2`。
- 源码目录：<https://github.com/hunxuankai/wxpusher-integration/tree/67fdb08b4fa574f2c4c2213838dc142f837e9ea2/skills/wxpusher-integration>。

## 认领

按用户要求先通过 Edge 中的 Skillstore 认领表单提交申请。核验当前 GitHub
登录账号拥有来源仓库后，提供公开仓库归属、账号资料链接和维护目的作为证明。
证明材料未包含密码、令牌或个人通知配置。

- 认领申请 ID：`1267cccf-04ca-41a1-b518-b1e9d7e71eab`。
- 进度页：<https://skillstore.io/zh-hans/me/skills?request=1267cccf-04ca-41a1-b518-b1e9d7e71eab>。
- 平台已显示“认领申请已提交”，申请详情状态为“待审核”。
- 平台明确要求管理员人工审核；提交成功不表示所有权认领已获批准。

## 版本更新提交

认领申请提交后，通过平台的 GitHub URL 提交入口递交固定提交的 skill 子目录。
补充说明明确这是现有条目从 1.0.3 升级到 1.0.4，并请审核员先完成认领审核，
再批准或发布版本更新。没有将此次提交描述为新增 skill。

- 更新提交 ID：`b06904b2-2d4f-4d14-9467-1a24a84d61ec`。
- 进度页：<https://skillstore.io/zh-hans/submissions/b06904b2-2d4f-4d14-9467-1a24a84d61ec>。
- 初始状态：平台已接受，显示“待处理”；预计发现 1 个 skill。
- 自动处理：<https://github.com/aiskillstore/marketplace/actions/runs/39148615379>。
- 平台已完成来源发现，确认固定提交和 `skills/wxpusher-integration` 范围；预检为
  `processable`，理由 `all_selected_targets_are_updates`，唯一既有目标是
  `skills/hunxuankai/wxpusher-integration`。已确认此次处理属于现有条目更新。
- 自动处理阶段已成功：扫描 8 个文件，风险结论 `safe`；1 个 skill 进入 `pending`，
  `Published: 0`、`Duplicates: 0`、`Errors: 0`。该阶段成功不等于平台批准发布。
- 平台已创建 [更新审核 PR #3838](https://github.com/aiskillstore/marketplace/pull/3838)，
  状态页变为“审核中”，PR 为 `Open`，带有 `pending-review` 标签。
- PR 来源提交为 `0d9346eaf1876c4fd7c12cc1f7531516b77e8e5d`；浏览器检查其文件差异，
  确认待审 `SKILL.md` 的 `metadata.version` 为 `1.0.4`、`docs-verified` 为 `2026-10-08`。
- 提交方式是源码链接，没有上传 ZIP；未启用可选的 GitHub 审核通知授权。

说明中列出 1.0.4 的触发边界、中文入口、微信 ClawBot/iLink 接收条件、错误处理
和 SPT 不确定性修正，同时保留既有用户授权语义、MIT 许可和独立维护声明。

## 来源与检查

- `python tools/check_skill.py` 通过：8 个 skill 文件、15 个本地引用；YAML、JSON
  示例和基础凭据形态检查通过。
- `git diff --check` 通过。
- 当前 skill 内容与上述固定提交一致；仓库和 skill 内 MIT 许可文本一致。
- 发布来源已存在于公开 GitHub 仓库；仓库中其他未提交的维护记录不属于发布内容。
- 未修改 skill 本体、版本、API 核验日期或本机安装副本，未执行真实 WxPusher 投递测试。
- 当前 GitHub 安装源为 1.0.4；既有 GitHub Release 下载包仍为 1.0.3，本次未改动它。

## 当前结果

刷新认领进度后仍为“待审核”。版本更新已通过自动处理并生成审核 PR，状态为
“审核中”，等待最终审核。两项均不能记作已获平台批准，也不能据此宣称 Skillstore
公开版本已更新。Edge 中保留认领与更新的两个进度页。
