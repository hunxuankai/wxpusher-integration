# skills.sh 收录记录 — v1.0.3

- 核验日期：2026-10-08（Asia/Shanghai）。
- 详情页：<https://skills.sh/hunxuankai/wxpusher-integration/wxpusher-integration>。
- 公开来源：<https://github.com/hunxuankai/wxpusher-integration>。
- 源码目录：`skills/wxpusher-integration/`。
- 安装时默认分支提交：`9eb89166512f7e87531072f1760a12c4d0984612`。
- Skill 版本与许可：`1.0.3`，MIT。
- Skill 内容与已发布标签 `v1.0.3` 的提交
  `62d3591b9db27a757aa5c3ed9203944b169326c4` 一致。

## 平台方式

根据当日核验的 [官方 FAQ](https://skills.sh/docs/faq)，skills.sh 通过官方 CLI
安装时的匿名遥测自动收录公开 GitHub skill，无需单独上传 ZIP 或提交发布表单。
[CLI 文档](https://skills.sh/docs/cli)说明遥测默认启用；本次保留默认设置，
执行一次实际安装，没有重复安装以增加计数。

平台能识别本仓库的 skill 子目录、`SKILL.md` 名称和描述；不需要移动源码、
重新打包或添加平台专有元数据。完整 MIT 许可随 skill 的 `LICENSE.md` 分发。

## 执行与验证

在仓库之外的全新临时目录，使用当时 npm 最新版 `skills@1.7.1` 执行：

```sh
npx --yes skills@1.7.1 add hunxuankai/wxpusher-integration --list
npx --yes skills@1.7.1 add hunxuankai/wxpusher-integration --skill wxpusher-integration --agent codex --copy --yes
```

- CLI 发现且成功安装 1 个 skill；安装内容限定为 skill 子目录。
- 对本地源码和 CLI 安装副本分别运行 `tools/check_skill.py`，均通过：
  8 个文件、12 个本地引用，YAML、JSON 示例及基础凭据形状检查通过。
- 安装副本的 8 个文件与 `v1.0.3` Git blob 逐字节一致；许可副本与仓库许可一致。
- 发布提交的基础凭据形状及本机私有路径扫描未发现匹配项；此检查不是完整秘密检测。
- 独立只读检索验证覆盖维护文档中的 6 个场景，均能正确获取并应用规则。
- CLI 锁文件确认来源为 `hunxuankai/wxpusher-integration`，skill 路径为
  `skills/wxpusher-integration/SKILL.md`，内容哈希为
  `34c169cbef51565162c5835c565144764ae5c9b1cd70b3f203989058b359a06b`。
- 安装后重新获取公开详情页，已显示 skill 正文、GitHub 来源和安装命令；
  此前同一地址显示 skill 不存在。

## 结果与范围

详情页已上线，可使用以下命令安装：

```sh
npx skills add hunxuankai/wxpusher-integration --skill wxpusher-integration
```

核验时安装统计和首次收录时间仍显示占位符，不据此声称已有排行榜名次。
本次未改变 skill 本体、版本、API 核验日期或既有授权语义，未执行真实 WxPusher 推送。
验证只安装到临时目录，没有改写用户级安装副本或在维护仓库中创建重复 skill。
