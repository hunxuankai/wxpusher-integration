# 维护与发布

## 2026-10-07 整理记录

- 以现有安装版 1.0.2 建立独立源码仓库，保留 skill 的 7 个文件和原有核验日期。
- 将维护约定、工具和发布说明放在仓库外层。skill 本体中的历史维护记录仍保留，避免本次搬迁改变已验证内容。
- 源码是后续修改的唯一来源；本机安装目录接收验证后的副本。
- 未配置远程仓库、未发布、未选定许可证，也未发送真实通知。
- 本次验证：7 个源码文件与原安装版逐字节一致；结构检查通过；在临时目录验证了
  预览不写文件、首次安装、更新前备份、保留目标额外文件和拒绝失效的相对引用。

## 2026-10-07 发布准备记录（1.0.3）

- 作者选定 MIT，版权署名为 `WxPusher`；仓库根目录和 skill 安装目录分别附带相同许可文本。
- 将 skill 版本升为 1.0.3；运行流程、触发规则及 API references 均与 1.0.2 相同，API 核验日期未刷新。
- 已按作者要求创建公开仓库 <https://github.com/hunxuankai/wxpusher-integration> 并关联 `origin`；
  此记录对应的准备阶段尚未推送代码、创建远程标签或发布 Release。
- 增加安装说明、Release 正文草稿、从干净提交打包的步骤，以及只读权限的 GitHub 检查配置。
- 本地结构检查通过（8 个 skill 文件、12 个本地引用）；两份 MIT 文本一致，且与官方模板替换年份、署名后的内容相符。
- Windows 临时目录验证通过：预览不写文件、首次安装完整复制、安装后校验通过、再次预览无变动，许可文件与源码一致。
- Skill Creator 结构校验通过；Windows 默认 GBK 环境运行该外部工具时需使用 `python -X utf8`。
- 已审阅全部变更并对当前文件及既有提交树执行基础凭据形状、私有路径扫描，未发现匹配项；该扫描不等于完整秘密检测。
  既有提交使用非 GitHub noreply 邮箱；本次未改写历史，正式公开代码前需核对作者邮箱公开偏好。
- 独立只读审阅未发现阻断问题。GitHub Actions 尚未在线运行，Linux 安装尚未实测；
  本次没有重新核验 API 或执行真实 API 集成测试，其他 skill 平台也未进行发布验证。
- 发行附件置于被 Git 忽略的 `dist/`；其 Git 来源以随包的 `.commit.txt` 为准。
- 已复现并处理 Windows 子目录归档的换行转换：归档时显式使用 `core.autocrlf=false`，
  以保持包内文件与提交中的 Git blob 逐字节一致。

## 每次修改

1. 阅读根目录 `AGENTS.md`，检查工作区现有改动。
2. 修改 `skills/wxpusher-integration/`，必要时重新核对官方资料并记录来源。
3. 对本体修改选择合适的新版本，更新 `SKILL.md`、`references/maintenance.md` 和 README 的版本说明。
4. 运行 `python tools/check_skill.py`、`git diff --check`，人工检查 diff 和敏感内容。
5. 对修改涉及的行为执行下面的检索场景；验证方式默认是离线阅读和受控假响应。
6. 提交 Git。需要更新本机使用版本时，运行安装脚本；需要发布时再执行发布步骤。

许可文件有两份：仓库根目录 `LICENSE` 和 `skills/wxpusher-integration/LICENSE.md`。
修改时保持文本一致；后者随安装包复制，因此许可修改也属于 skill 本体变更。

## 检索场景

这些是供维护代理实际执行的场景，不是通过匹配固定措辞评分的测试：

| 场景 | 应能得出的结论 |
| --- | --- |
| SPT 泄漏后，重新扫码是否解决风险？ | 公开文档未提供重置/撤销方法；不能承诺旧值失效，也不能把 appToken 重置套用于 SPT。 |
| 发送 30000 个普通汉字 | 虽未超字符上限，但约 90000 个 UTF-8 字节已超限；原文和转换后的 HTML 均有限制。 |
| 用户指定官方 SPT GET，已有适用的长期授权 | 按路径段编码和既有授权执行，不因 skill 再次索要相同授权。 |
| 顶层 code=1000，某目标 code 非 1000 | 报告失败或部分失败，不能宣称所有目标均已接受或用户已收到。 |
| 标准 GET 同时提供多个 UID 和 Topic | 指出 GET 的目标限制，需要此能力时使用标准 POST。 |
| 用户只说“加微信通知”，没有选择提供商 | 不擅自选择 WxPusher。 |

如涉及真实发送，遵循用户已经明确授权的用途、目标和次数；维护工具本身不发送消息。

## 安装与回滚

运行 `./tools/install-local.ps1 -DryRun` 检查源和目标；正常执行前脚本会自动做离线校验。
脚本不会删除目标独有文件。发现这类文件时先判断是否包含本地改动或旧版文件，再作定向处理。

更新已有副本时，终端会显示备份位置。需要回滚时先保存当前目标，再将选定的旧版
完整 skill 副本恢复到宿主安装目录，并核对文件清单和哈希；不要用仓库历史覆盖未审查的本地改动。

## 发布前

- 作者确定许可证；若使用第三方文本或素材，核对其许可和署名要求。
- 确认目标平台的命名、版本、源码子目录、ZIP 根目录和附加元数据要求；不假定不同平台格式相同。
- 从干净且已验证的提交生成发布内容，记录 Git 提交和平台版本；正式发行时再创建对应版本标签。
- Skill 本体以 `skills/wxpusher-integration/` 为根，按平台要求附带许可文本；维护目录、备份、临时文档、个人通知地址和凭据不进入发布包。
- 如果平台只接受仓库根目录的 skill，再据其具体规范生成发行目录或分支；不要为未核实的平台限制复制维护多份源码。
- 当前仓库只保证本地结构与工作流经过检查，不宣称已通过任何共享平台审核。

## GitHub 发行步骤

仓库：<https://github.com/hunxuankai/wxpusher-integration>。
GitHub 托管整个维护仓库；Release 附件只包含 skill，二者不使用相同的打包根目录。
根目录和包内的许可文本均使用 MIT，版权署名由作者指定为 `WxPusher`。

### 1. 校验并提交

运行 `python tools/check_skill.py`、`git diff --check`，检查完整 diff（包括新增文件）、
许可文本一致性、敏感信息和第三方署名。公开前同时检查全部 Git 历史，以及提交作者邮箱是否适合公开。
若采用 GitHub 隐私邮箱，在新的提交前设置仓库级邮箱；修改配置不会改变既有提交。
不要未经审阅重写旧历史。

变更提交后，使用该提交作为发行来源；维护验证结果及未执行的项目记录在本文件中。

### 2. 从干净提交生成 ZIP

以下 PowerShell 7 命令以 `1.0.3` 为例。它们不推送、不创建远程 Release，输出放入已忽略的 `dist/`。
归档只读取提交中的 skill 目录，不读取工作区里的未提交内容。

```powershell
$ErrorActionPreference = 'Stop'
$releaseStatus = git status --porcelain
if ($LASTEXITCODE -ne 0 -or $releaseStatus) { throw '先审阅并提交工作区改动。' }
python tools/check_skill.py
if ($LASTEXITCODE -ne 0) { throw 'Skill 校验失败。' }
$releaseVersion = '1.0.3'
$sourceVersion = python -c "import pathlib,yaml; print(yaml.safe_load(pathlib.Path('skills/wxpusher-integration/SKILL.md').read_text(encoding='utf-8').split('---',2)[1])['metadata']['version'])"
if ($LASTEXITCODE -ne 0 -or $sourceVersion -ne $releaseVersion) { throw '版本不一致。' }
$releaseCommit = git rev-parse HEAD
if ($LASTEXITCODE -ne 0) { throw '无法读取发行提交。' }
$releaseBase = "wxpusher-integration-$releaseVersion"
$archivePath = "dist/$releaseBase.zip"
$checksumPath = "dist/$releaseBase.sha256"
$commitPath = "dist/$releaseBase.commit.txt"
foreach ($outputPath in @($archivePath, $checksumPath, $commitPath)) {
    if (Test-Path -LiteralPath $outputPath) { throw "发行文件已存在，请先审查：$outputPath" }
}
New-Item -ItemType Directory -Path 'dist' -Force | Out-Null
git -c core.autocrlf=false archive --format=zip --prefix=wxpusher-integration/ --output=$archivePath "${releaseCommit}:skills/wxpusher-integration"
if ($LASTEXITCODE -ne 0) { throw '归档失败。' }
$archiveHash = (Get-FileHash -LiteralPath $archivePath -Algorithm SHA256).Hash.ToLowerInvariant()
"$archiveHash  $releaseBase.zip" | Set-Content -LiteralPath $checksumPath -Encoding ascii
$releaseCommit | Set-Content -LiteralPath $commitPath -Encoding ascii
```

解压检查 ZIP 中恰好有一层 `wxpusher-integration/`，其下直接是 `SKILL.md`、`LICENSE.md`、
`references/` 和 `agents/`；运行检查器验证解压目录，并核对内容与发行提交一致。
归档的 `-c core.autocrlf=false` 只对这条命令生效，避免子目录归档受本机换行配置影响；不会修改 Git 配置。
如生成后仍需修改源码，应使用新提交重新生成候选；已发布版本不能悄悄替换内容。

### 3. 正式公开代码与版本

只有进入已授权的正式发布任务时，才推送已验证提交并创建对应版本标签。
查看 GitHub Actions 检查结果；通过后以 `docs/releases/v1.0.3.md` 为正文创建 Release，
附上 `.zip`、`.sha256` 和 `.commit.txt` 三个文件。
用 GitHub CLI 填写正文时使用 `--notes-file`，以保留 Markdown 换行。
核对标签指向发行提交，下载附件验证校验值，再记录发行 URL。

当前 GitHub 检查流程在每次 push、pull request 或手动触发时运行；它不会自动推送、打标签或发布。
