# 数据部门工作指南怎样把读者引到一条规则？规则又怎样改动？ {#guide}

这份指南是一个文档仓库，成员和智能体不用安装任何软件就能读。[](source:readme-repo)一张任务地图把每个工作问题引到对应规则所在的主题，这些规则都写在章程统领的七个主题里。[](source:map-open)[](source:profile-sources)规则要改，只能走一项 OpenSpec 正式变更：先由已安装的 ETHOS 准入和证明，各个代码托管平台才发布这个版本。[](source:gov-change)

- [每条规则只归一处管](block:p-topics)：导航、范例、决策记录和治理页面都链接过去，不另写一遍。[](source:gd-owner)
- [章程约束每个主题](block:p-charter)：所有工作都要守住四条底线，记录采取什么形式看风险。[](source:charter-boundaries)[](source:charter-risk)
- [改动先准入，后写入](block:p-change)：写入之前，先要选定一项正式变更，拿到自己的工作通道，并让确切路径通过准入。[](source:agents-change)
- [检查通过，不等于已经采用](block:p-open)：路线读得通，既证明不了成员在用这份指南，也证明不了工作变好了。[](source:charter-judgment)

@answer scope="DDWG v8.0.0 · 提交 b9da15d · 文档、规格和配置"
@meta locale=zh-CN style=editorial
@source readme-start title="从工作问题开始" path="README.md" lines=8:10
@source readme-repo title="文档仓库" path="README.md" lines=15:21
@source agents-scope title="智能体入口" path="AGENTS.md" lines=3:7
@source agents-change title="改动已跟踪的源文件之前" path="AGENTS.md" lines=9:16
@source map-open title="每个工作问题对应一页" path="docs/README.md" lines=11:15
@source map-groups title="任务地图的路线" path="docs/README.md" lines=17:64
@source map-route title="是阅读路线，不是阶段" path="docs/README.md" lines=66:71
@source map-maintain title="维护本仓库" path="docs/README.md" lines=78:88
@source charter-purpose title="什么时候读章程" path="docs/charter.md" lines=13:17
@source charter-authority title="行动依据" path="docs/charter.md" lines=42:57
@source charter-facts title="事实依据" path="docs/charter.md" lines=59:68
@source charter-boundaries title="四条底线" path="docs/charter.md" lines=76:90
@source charter-risk title="形式随风险而定" path="docs/charter.md" lines=96:108
@source charter-review title="独立评审" path="docs/charter.md" lines=110:115
@source charter-judgment title="规则为判断服务" path="docs/charter.md" lines=151:153
@source charter-version title="指南的管理" path="docs/charter.md" lines=155:164
@source decide-record title="记下选择和下一步行动" path="docs/decide.md" lines=156:162
@source decide-act title="行动开始之后" path="docs/decide.md" lines=176:179
@source deliver-loop title="工作循环" path="docs/deliver.md" lines=80:93
@source deliver-states title="说做到哪一步，不说花了多少力气" path="docs/deliver.md" lines=95:112
@source deliver-urgent title="紧急遏制" path="docs/deliver.md" lines=25:30
@source data-close title="完成说法交给执行与交付收尾" path="docs/data.md" lines=93:96
@source communicate-next title="完成报告与尚未界定的问题" path="docs/communicate.md" lines=184:186
@source agent-model title="智能体怎样执行" path="docs/human-agent.md" lines=114:133
@source agent-uses title="由别人负责的决策" path="docs/human-agent.md" lines=62:66
@source evolve-governance title="规则要改，仍走仓库治理" path="docs/evolve.md" lines=242:244
@source records-register title="决策记录保存什么" path="docs/decisions/README.md" lines=22:45
@source dr4-decision title="DR-0004：正式变更的生命周期" path="docs/decisions/dr-0004-official-lifecycle.md" lines=21:35
@source dr5-decision title="DR-0005：按已交付范围关闭" path="docs/decisions/dr-0005-change-closure-scope.md" lines=29:50
@source dr5-alternatives title="DR-0005：被否决的备选方案" path="docs/decisions/dr-0005-change-closure-scope.md" lines=52:60
@source gov-change title="实质改动与代码托管平台" path="docs/governance/README.md" lines=11:13
@source gov-split title="规程与边界" path="docs/governance/README.md" lines=24:25
@source gov-authority title="变更权限" path="docs/governance/README.md" lines=29:33
@source gov-archive title="验收不等于交付完结" path="docs/governance/README.md" lines=42:45
@source gov-planes title="四个层面的证据" path="docs/governance/README.md" lines=47:60
@source gov-peers title="发布按平台分别验收" path="docs/governance/README.md" lines=62:72
@source gov-version title="唯一的发布标识" path="docs/governance/README.md" lines=84:94
@source gov-checks title="每项检查和它的使用方" path="docs/governance/README.md" lines=153:170
@source gov-no-code title="只为无人负责的职责写代码" path="docs/governance/README.md" lines=172:178
@source config-map title="配置地图" path="docs/governance/configuration.md" lines=16:26
@source contrib-audience title="贡献指南写给谁" path="CONTRIBUTING.md" lines=3:11
@source contrib-full title="完整的源文件检查" path="CONTRIBUTING.md" lines=37:51
@source contrib-links title="链接验收仍待完成" path="CONTRIBUTING.md" lines=85:94
@source contrib-spelling title="临时拼写词表" path="CONTRIBUTING.md" lines=67:72
@source contrib-supply title="准备好 ETHOS" path="CONTRIBUTING.md" lines=152:167
@source contrib-prepare title="准备版本" path="CONTRIBUTING.md" lines=223:228
@source contrib-prove title="证明并验收源文件" path="CONTRIBUTING.md" lines=230:242
@source contrib-cut title="定版并打标签" path="CONTRIBUTING.md" lines=244:275
@source contrib-publish title="在所选平台上发布" path="CONTRIBUTING.md" lines=289:302
@source contrib-verify title="核验已发布的版本" path="CONTRIBUTING.md" lines=344:349
@source change-record title="一项进行中的正式变更" path="openspec/README.md" lines=3:12
@source change-admission title="ETHOS 负责准入和收尾" path="openspec/README.md" lines=30:41
@source specs-index title="六项能力" path="openspec/specs/README.md" lines=3:20
@source gd-entry title="按任务查找指南" path="openspec/specs/guidance-discovery/spec.md" lines=11:19
@source gd-owner title="每条规范只归一处" path="openspec/specs/guidance-discovery/spec.md" lines=43:48
@source gd-install title="阅读无需安装" path="openspec/specs/guidance-discovery/spec.md" lines=466:470
@source wp-purpose title="工作实践" path="openspec/specs/work-practice/spec.md" lines=3:18
@source quality-purpose title="文档质量" path="openspec/specs/quality/spec.md" lines=3:8
@source verification-proof title="证明只用已安装的检查" path="openspec/specs/verification/spec.md" lines=24:31
@source verification-review title="评审读者的理解" path="openspec/specs/verification/spec.md" lines=10:22
@source rg-license title="同一份 MIT License 授权" path="openspec/specs/repository-governance/spec.md" lines=12:19
@source rg-binding title="仓库治理绑定什么" path="openspec/specs/repository-governance/spec.md" lines=56:79
@source publication-identity title="发布标识" path="openspec/specs/publication/spec.md" lines=304:310
@source profile-sources title="规范来源" path=".ethos/profile.toml" lines=1:21
@source release-peers title="发布声明" path=".ethos/release.toml" lines=1:27
@source mise-supply title="按锁文件安装 ETHOS" path=".config/mise/config.toml" lines=1:31
@source ci-projection title="生成的流水线" path=".config/checks/ci-projection/policy.toml" lines=1:16
@source github-job title="GitHub 作业" path=".github/workflows/ci.yml" lines=36:46
@source version-file title="VERSION" path="VERSION" lines=1:1
@source changelog-intro title="更早的版本没有发布标签" path="CHANGELOG.md" lines=10:11
@source changelog-400 title="4.0.0 的发布" path="CHANGELOG.md" lines=769:808
@source changelog-800 title="8.0.0 的发布" path="CHANGELOG.md" lines=17:183

## 谁读这份指南，从哪里开始？ {#p-readers}

成员和智能体读同一套页面，不用安装任何软件。[](source:readme-repo)[](source:gd-install)

@diagram architecture id=readers-map source=readers.architecture.json

@steps id=readers-steps
| step-rd-members | 成员和智能体 | 从工作问题开始，首页把读者引到任务地图，不再列一遍主题清单。[](source:readme-start)[](source:gd-entry) | readers-map | rd-members |
| step-rd-agents | 智能体入口 | 智能体在委托范围内工作；章程规定依据和底线，验收留在人手里。改动之前，智能体先读治理页面。[](source:agents-scope)[](source:agents-change) | readers-map | rd-agents |
| step-rd-map | 任务地图 | 每个工作问题都引到负责它的章节；紧急故障或越界的路线排在最前。[](source:map-open) | readers-map | rd-map |
| step-rd-contributing | 贡献指南 | 收录维护者修改、检查或发布时用的命令。编辑之前，维护者先读治理页面，再运行 `ethos status`。[](source:contrib-audience) | readers-map | rd-contributing |
| step-rd-governance | 仓库变更与发布 | 权限、验收和撤下的边界归它管，规程归贡献指南。[](source:gov-split) | readers-map | rd-governance |

## 哪个主题负责哪类工作问题？ {#p-topics}

任务地图按工作类型给路线分组。这些是阅读路线，不是每项任务都必须经过的阶段。[](source:map-route)

@diagram tree id=topics-tree source=topics.tree.json

@steps id=topics-steps
| step-tp-urgent | 紧急故障或越界 | 直接转到“紧急情况与例外”，排在所有常规路线之前。[](source:map-open) | topics-tree | tp-urgent |
| step-tp-direction | 方向与决策 | 查清依据，定下风险级别，界定决策，或者诊断故障。[](source:map-groups) | topics-tree | tp-direction |
| step-tp-delivery | 数据与交付 | 证明数据资产适合用途，变更共享数据，或者对照完成条件为工作收尾。[](source:map-groups) | topics-tree | tp-delivery |
| step-tp-collab | 协作与改进 | 准备汇报，上报风险，委托智能体，辅导成员，或者改进实践。[](source:map-groups) | topics-tree | tp-collab |
| step-tp-maintain | 维护本仓库 | OpenSpec 和 ETHOS 管变更权限；现行规则解释不了的理由，记在决策记录里。[](source:map-maintain) | topics-tree | tp-maintain |

ETHOS 配置档把同样这七个主题列为仓库的规范来源。[](source:profile-sources)

## 章程要求每个主题遵守什么？ {#p-charter}

要弄清谁可以决定、哪些事实可信、哪条边界必须守住，就读章程。[](source:charter-purpose)规则的字句对成员和他们的智能体一样有约束力；风险决定工作采取什么形式，不决定要不要尽这份职责。[](source:charter-risk)

| 级别      | 适用情形                                   | 最低要求                                                              |
| --------- | ------------------------------------------ | --------------------------------------------------------------------- |
| L0 轻量   | 局部、可逆、没有对外承诺的工作             | 一次讲清结论、依据和做法                                              |
| L1 标准   | 跨角色、方案相互竞争或有重大不确定的工作   | 在现有记录里写清问题、方案、做法和验收                                |
| L2 高风险 | 涉及生产、资金、敏感数据、覆盖或不可逆操作 | 书面决定、授权、回滚、独立评审，最后由人验收[](source:charter-review) |

@facts
| 说真话 | 不编造、不隐瞒、不挑着说；没把握的不说成有把握。[](source:charter-boundaries) |
| 守边界 | 对象、时间、能力、权限、数据、安全、合规和行动的界限都要守住。[](source:charter-boundaries) |
| 责任落到人 | 重要的判断、决定、变更和验收，都有人负责。[](source:charter-boundaries) |
| 不虚报完成 | 没有对得上的当前证据，就不说完成、正确、可用或已采用。[](source:charter-boundaries) |

@callout level=note title="两种依据"
| 行动依据回答谁可以决定，事实依据回答靠什么认定一件事是真的。有了一种依据，不等于有了另一种；任何智能体、工具或文件，都不能给自己授予权限。[](source:charter-authority)[](source:charter-facts) |

## 各主题之间怎样交接工作？ {#p-handoffs}

每个主题管自己的规则，下一项职责归谁，就链接到谁。[](source:map-open)

@diagram architecture id=handoffs-map source=handoffs.architecture.json

@steps id=handoffs-steps
| step-ho-agent | 人与人工智能的协作 | 智能体先搭一个刚好够用的模型，写入之前再核对执行的前提条件。[](source:agent-model) | handoffs-map | ho-agent |
| step-ho-uses | 数据质量与采用 | 专业决策和用途决策归它负责，委托出去的工作定不了这些；数据方面的完成说法，交给执行与交付收尾。[](source:agent-uses)[](source:data-close) | handoffs-map | ho-data |
| step-ho-decide | 分析与决策 | 选择按决策文档的顺序记录；行动一开始，执行与交付就接手。[](source:decide-record)[](source:decide-act) | handoffs-map | ho-decide |
| step-ho-deliver | 执行与交付 | “完成”归它负责：决策开始执行后，以及写每份完成报告时，都要按它的完成条件、证据边界和工作状态的叫法来。[](source:decide-act)[](source:communicate-next)[](source:deliver-states) | handoffs-map | ho-deliver |
| step-ho-evolve | 实践与演进 | 紧急路线归它管，紧急遏制就走这条路线；规则要改，仍走仓库治理。[](source:deliver-urgent)[](source:evolve-governance) | handoffs-map | ho-evolve |

工作循环依次是界定、分析、决定、执行、核验和总结。这些动作指引工作，不是彼此分开的阶段。[](source:deliver-loop)

## 哪些规格写明了指南必须做到什么？ {#p-specs}

OpenSpec 工作空间里的六份能力规格，保存已验收的需求。需求要写进去，只能走正式变更。[](source:specs-index)[](source:change-record)

| 能力     | 关注                 | 约束什么                                                                                          |
| -------- | -------------------- | ------------------------------------------------------------------------------------------------- |
| 指南查找 | 找到合适的指南       | 两个入口、任务地图，每项义务只在一处维护[](source:gd-entry)[](source:gd-owner)                    |
| 工作实践 | 把指南用到实际工作中 | 决策、数据、交付、沟通、智能体和辅导方面的职责[](source:wp-purpose)                               |
| 文档质量 | 维护可读的源文件     | 英文行文、链接和原生检查策略[](source:quality-purpose)                                            |
| 核验     | 拿出检查过的结果     | CI 由 CUE 统一定义，配置档不设门禁[](source:verification-proof)                                   |
| 仓库治理 | 变更或验收源文件     | MIT License 授权、同一张签名提交图、发布声明和 OpenSpec[](source:rg-license)[](source:rg-binding) |
| 发布     | 发布或撤下资产       | VERSION、变更日志、签名标签、托管作业和两个平台[](source:publication-identity)                    |

工作实践规格不增加任何权限，也不认定团队已经采用。[](source:wp-purpose)质量检查确认的是源文件的属性，含义仍要由人评审。[](source:quality-purpose)

## 一项改动怎样提出、检查和准入？ {#p-change}

已安装的 ETHOS 负责改动归属、工作通道租约、准入、证明、验收和发布。它按当前的源文件行事，不凭记下来的旧结果。[](source:gov-authority)

@sequence id=change-flow title="一项改动：从提案到发布"
| actor ch-maintainer | 维护者 | external |
| actor ch-change | 正式变更 | backend | source:change-record |
| actor ch-runtime | 已安装的 ETHOS | security | source:change-admission |
| actor ch-forge | 所选平台 | cloud | source:gov-peers |
| phase | 提出 |
| ch-maintainer | ch-change | 提案、设计、增量、任务 |
| ch-maintainer | ch-runtime | status，再拿到自己的工作通道 |
| phase | 写入 |
| ch-maintainer | ch-runtime | 对确切路径做写前准入 |
| ch-runtime | ch-maintainer | 通过 | return |
| ch-maintainer | ch-runtime | 签名提交，经过钩子 |
| phase | 证明与验收 |
| ch-maintainer | ch-runtime | 证明确切的 HEAD | emphasis |
| ch-runtime | ch-maintainer | 通过、阻断或未知 | return |
| ch-maintainer | ch-runtime | 验收进入 dev |
| phase | 收尾 |
| ch-maintainer | ch-change | 归档为一次新提交 |
| ch-maintainer | ch-runtime | 证明归档提交 |
| ch-maintainer | ch-forge | 发布到这个平台 |

@steps id=change-steps
| step-ch-change | 正式变更 | 提案、设计、规格增量和任务进度都放在这里，方法包或决策记录取代不了它。[](source:change-record)[](source:dr4-decision) | change-flow | ch-change |
| step-ch-runtime | 已安装的 ETHOS | 就在写入之前，对确切路径做准入；每次提交和推送，由它的 Git 钩子准入。[](source:agents-change)[](source:contrib-audience) | change-flow | ch-runtime |
| step-ch-prove | 已安装的 ETHOS | 证明在确切的 HEAD 上执行完整检查图；遇到拒绝，决不用直接推送绕过。[](source:contrib-prove) | change-flow | ch-runtime |
| step-ch-archive | 正式变更 | 验收进入 dev，交付并没有结束；归档提交还要有自己的签名、证明和发布。[](source:gov-archive) | change-flow | ch-change |
| step-ch-forge | 所选平台 | 每个平台各自发布、各自核验；一个平台的结果，证明不了另一个平台的任何事。[](source:gov-peers) | change-flow | ch-forge |

## 检查读什么？ {#p-checks}

仓库没有自己的软件包、测试或检查命令；每项检查都由已安装的 ETHOS 运行。[](source:contrib-full)[](source:gov-no-code)

| 检查                        | 原生输入                                      |
| --------------------------- | --------------------------------------------- |
| Markdown、JSON 和 YAML 格式 | `.config/checks/prettier/` 下的 Prettier 策略 |
| TOML 格式                   | `.config/checks/taplo/` 下的 Taplo 策略       |
| 行文与部门术语              | Vale，外加一份临时拼写词表                    |
| 本地链接和锚点              | `.config/checks/lychee/` 下的 Lychee 参数     |
| ETHOS 安装                  | Mise 配置及其锁文件                           |
| 生成的 CI                   | 核验参数和 Runner 声明                        |

这些指向都记在配置地图里，治理页面写明每一项由哪个已安装的检查读取。[](source:config-map)[](source:gov-checks)Mise 按锁文件安装唯一的 ETHOS 发布版本，这个版本自带 Node、格式化工具，以及行文和链接工具。[](source:mise-supply)[](source:contrib-supply)通用模型依据这些参数生成两个平台的流水线，每个托管作业都运行同一张完整检查图。[](source:ci-projection)[](source:github-job)

## 一个版本怎样在两个平台上发布？ {#p-release}

`VERSION` 记着唯一的发布标识，章程也链接到它；发布的确切内容，只有签名标签能认定。[](source:gov-version)[](source:charter-version)[](source:version-file)

@workflow id=release-flow title="一个版本，发布到选定的平台"
| rl-prepare | 准备版本 | backend |
| rl-prove | 证明并验收 | security |
| rl-cut | 定版并打标签 | backend |
| rl-publish | 创建发布版本 | external |
| rl-verify | 核验版本 | backend |
| rl-prepare > rl-prove | |
| rl-prove > rl-cut | 已验收 |
| rl-cut > rl-publish | 签名标签 | emphasis |
| rl-publish > rl-verify | |

@steps id=release-steps
| step-rl-prepare | 准备版本 | 在正式变更里更新 `VERSION`，说明写在 Unreleased 一节，定版之前不写日期。[](source:contrib-prepare) | release-flow | rl-prepare |
| step-rl-prove | 证明并验收 | 用可信的 SSH 签名提交，再证明确切的 OID；每项已声明义务都有证据，才能归档。[](source:contrib-prove) | release-flow | rl-prove |
| step-rl-cut | 定版并打标签 | 给这一节写上日期，再证明一次；所选平台的源文件检查作业通过后，才为标签签名。[](source:contrib-cut) | release-flow | rl-cut |
| step-rl-publish | 创建发布版本 | 同一份评审过的发布说明发到该平台；从 8.0.0 起，版本不附带下载文件。[](source:contrib-publish) | release-flow | rl-publish |
| step-rl-verify | 核验版本 | 核对该标签在这个平台上的 Git 引用、发布版本和源文件 CI。另一个平台的交付先不结，等它自己的检查通过。[](source:contrib-verify) | release-flow | rl-verify |

@facts
| GitLab | 组织主要的发布平台[](source:gov-planes) |
| GitHub | 独立的仓库、CI/CD 和分发，GitLab 中断时也照常提供[](source:gov-planes) |
| 按平台 | 发布按平台分别验收，不是跨两个平台的事务[](source:gov-peers) |
| 已声明 | 发布声明绑定两个平台，以及已验收内容的快进镜像[](source:release-peers)[](source:rg-binding) |

## 为什么只走一项正式变更？它什么时候关闭？ {#p-decisions}

决策记录保存长期的选择和被否决的备选方案，不记任务、命令或日志。[](source:records-register)DR-0004 和 DR-0005 定下了改动走什么载体、什么时候关闭。[](source:dr4-decision)

| 决策                        | 选定                                                                       | 否决                                                            |
| --------------------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------- |
| DR-0004：正式变更的生命周期 | 意图写在一项 OpenSpec 正式变更里，工作通道、证明和发布归 ETHOS {good:选定} | 私有的生命周期、把方法包当作正式变更、只做镜像的平台 {bad:否决} |
| DR-0005：关闭范围           | 按已交付的任务关闭正式变更；其余任务注明理由后撤出 {good:选定}             | 等所有环境就绪，或者勾选未完成的任务 {bad:否决}                 |

撤出的任务去掉复选框，但保留所在行和标识，所以归档后的正式变更仍能看出整个计划。[](source:dr5-decision)[](source:dr5-alternatives)

## 这套指南怎样走到今天？ {#p-history}

正式的版本号从 v4.0.0 开始，这一版于 2026 年 9 月 26 日发布；此前各分支版本都没有打发布标签。[](source:changelog-intro)[](source:changelog-400)时间线从中挑出十一个版本，最后一个是 2026 年 11 月 1 日发布的 v8.0.0；这些版本都改变了成员、智能体或维护者读到的内容。[](source:changelog-800)

@diagram timeline id=history source=history.timeline.json title="这套指南怎样走到今天"

## 哪些已有定论，哪些仍待解决？ {#p-open}

源文件自己写明了尚未解决的事项，以及检查的局限。

| 方面               | 状态                        | 含义                                                                                               |
| ------------------ | --------------------------- | -------------------------------------------------------------------------------------------------- |
| 读者路线           | 必需 {good:编辑评审}        | 必须用有代表性的成员任务和智能体任务走一遍路线；这项评审不等于采用。[](source:verification-review) |
| 工作区改动中的链接 | 待验收 {caution:未证明适合} | 源文件契约涵盖工作区和候选文件里的链接；已安装的检查涵盖已提交链接。[](source:contrib-links)       |
| 拼写               | 临时 {caution:补充词表}     | 共享拼写检查证明适合这套语料之前，仓库保留这份拼写词表。[](source:contrib-spelling)                |
| 团队使用           | 未证明 {caution:源文件之外} | 检查、证明和发布都不能说明成员在使用这份指南。[](source:map-maintain)                              |
