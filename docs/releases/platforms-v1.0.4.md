# SkillHub 与 skills.sh 更新记录 — v1.0.4

- 日期：2026-10-08。
- 发布来源：`67fdb08b4fa574f2c4c2213838dc142f837e9ea2`，skill 版本 `1.0.4`，MIT。
- 源码已推送到 GitHub `main`；[该提交的自动检查](https://github.com/hunxuankai/wxpusher-integration/actions/runs/37711818364)已成功。
- 使用 Edge 中现有登录会话操作平台；未修改图标、分类或账号权限。

## SkillHub

- 详情页：<https://skillhub.cn/skills/user_cbf4d189/wxpusher-integration>。
- 经“我的 Skills → 更新”上传独立 ZIP，平台识别为 8 个文件、总大小 54.8 KB。
- ZIP 只有一层 `wxpusher-integration/`，其下为 SKILL.md、LICENSE.md、agents 和 references；不包含维护仓库、个人配置或通知凭据。
- ZIP 的每个文件与发布来源提交逐字节一致；SHA-256：
  `10675d1d4944233d9f585e570c158f9edb418dfa5b5ff114276fd44dd77d3800`。
- 版本号为 1.0.4，描述补充接入场景及微信 ClawBot 条件，变更说明注明核验日期与未真实投递测试。
- 提交后控制台显示 `V 1.0.4`、`安全审核中`；这是更新已被接受，不表示审核完成或公开详情页已切换。

## skills.sh

- 详情页：<https://www.skills.sh/hunxuankai/wxpusher-integration/wxpusher-integration>。
- [FAQ](https://www.skills.sh/docs/faq)说明来源为 GitHub，CLI 安装通过匿名遥测触发收录。
- 已推送经过验证的 1.0.4 来源提交；在仓库之外的临时目录执行一次实际安装：

```sh
npx --yes skills@1.7.1 add hunxuankai/wxpusher-integration --skill wxpusher-integration --agent codex --copy --yes
```

- 新安装的 8 个文件与发布来源提交逐字节一致；元数据为 version=1.0.4、docs-verified=2026-10-08。
- 对安装副本执行仓库校验器通过（8 文件、15 个本地引用）；未改写用户级安装副本，也未在维护仓库创建重复 skill。
- 截至本次核验，详情页仍显示旧版“触发边界（Activation boundary）”正文；安装源已更新，网页快照尚未确认刷新。
- FAQ、API 和 Customize 文档中未找到手动刷新 skill 正文的公开入口。API 文档说明详情接口有 5 分钟缓存，不能将其当作网页快照刷新时限保证。

## 范围

未发送真实 WxPusher 消息，未新建 GitHub Release 或改写 v1.0.3 发行附件。
未把平台审核中或网页仍展示旧正文写成更新已完全上线。
