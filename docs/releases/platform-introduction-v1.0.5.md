# 1.0.5 平台介绍材料

来源：提交 `634107ef4e5c27ad817356c6c1bc1c599f86f075` 中的
`skills/wxpusher-integration/`，作者版本 1.0.5，MIT。各平台的实际字段、默认文件
或自定义概述模式及提交回执另记；准备本文不代表平台介绍已经更新。

## 中文简介

为脚本、后端、定时任务和 CI 接入或排查 WxPusher 通知；SPT 默认 JSON POST，完整保留斜杠和链接正文，涵盖 UID/Topic、业务码、凭据配置及微信 ClawBot 接收限制。

## English summary

Integrate and troubleshoot WxPusher notifications with SPT JSON POST, preserving slashes and URLs; covers UID/Topic, response checks, credentials, and receiving-channel limits.

## English overview

**Author version: 1.0.5 · License: MIT · Primarily in Simplified Chinese.**

WxPusher Integration is an Agent Skill for adding and troubleshooting WxPusher notifications
in scripts, backend services, scheduled tasks, and CI. Use it when the user has explicitly
chosen WxPusher. Generic UID or Topic terms, or an unspecified request for WeChat
notifications, do not independently select this provider.

Version 1.0.5 defaults existing SPT workflows to JSON POST at
`https://wxpusher.zjiecode.com/api/send/message/simple-push`. A single-recipient request
uses the existing `spt`, original `content`, and `contentType`. It preserves `/context`,
`https://...`, Chinese text, newlines, and percent signs through JSON serialization and
UTF-8 encoding, without URL percent-encoding the content or switching to appToken/UID.

SPT GET remains a limited convenience endpoint. Content containing slashes, which become
`%2F` in the path, should currently use POST. Do not work around this limitation with
double encoding, character replacement, or repeated requests. The current limitation is
recorded separately from the public documentation: it is supported by a prior invalid-token
test summary supplied by the user and the user's account of an official staff reply.
The reply has no public link or original support transcript; public documentation still
lists GET and does not explicitly describe this limitation.

The skill also covers standard JSON push, UID/Topic targeting, content formats and limits,
credential handling, response classification, bounded retries, and receiving-channel
troubleshooting. HTTP 200 is insufficient: check the top-level business code and every
returned target result. Acceptance means a task was created, not that the recipient read
or received it. The two legacy send-status query endpoints are now documented as disabled;
stop polling them and do not resend because of their retirement notice.

WeChat ClawBot/iLink text notifications require binding, enabling, and activation. Existing
channel limits still apply, and that channel currently does not support upstream messages.
This is not arbitrary friend or group messaging.

The package consists of 8 Markdown/YAML files, including SKILL.md, references, optional UI
metadata, and the complete MIT license. It contains no executable adapter or bundled test
suite and has no Python, Node.js, or PowerShell runtime dependency. A compatible agent host
provides file, HTTP, shell, and development tools for the authorized project task. Users
provide their own WxPusher credentials through their approved local configuration or
secret store. Existing, applicable long-term authorization is preserved.

Public SPT documentation, send responses, and retired status queries were rechecked on
2026-11-12; other API/SDK facts retain their previous verification dates. Windows checks
covered structure, 18 local references, YAML/JSON examples, credential patterns, whitespace,
file integrity, two independent request scenarios, and six controlled response fixtures.
UTF-8 JSON round trips preserve the original message, and the local installed copy matches
the source. No real WxPusher delivery test was performed; these checks do not establish
end-to-end delivery or real-device compatibility for every host.

Independently maintained; this is not an official WxPusher project.

Source: https://github.com/hunxuankai/wxpusher-integration/tree/634107ef4e5c27ad817356c6c1bc1c599f86f075/skills/wxpusher-integration

## Release changelog

Default SPT to UTF-8 JSON POST with the existing token and unmodified content; document the
current encoded-slash GET limitation without disabling GET; preserve authorization and
business-code checks; retire legacy status-query guidance. Public documentation and the
user-supplied prior test/support evidence are distinguished. Offline checks only.
