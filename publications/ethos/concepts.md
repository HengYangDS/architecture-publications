# ETHOS concepts

Each rendering below is fixed before translation and used throughout `zh/model.json` and `zh/overview.typ`. Source names
the file at ETHOS v0.2.0-beta.6 (`727ee05`) that defines or uses the term; "film" is the owner-approved Chinese
narration, `content/narration.md` of `ethos-film`. Product names, command names and their options, verdict values
(`pass`, `block`, `unknown`), file and ref names, and the kernel names Commitment, Facts and TransitionPlan stay in
Latin type.

| English                                       | 中文                                       | Source                                                                                                   |
| --------------------------------------------- | ------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| Attestation                                   | 核验记录                                   | `docs/reference/glossary.md`; film                                                                       |
| proof Attestation                             | 证明核验记录                               | `src/ethos/adapters/mutation/proof_record.py`                                                            |
| Attestation set                               | 核验记录集                                 | `src/ethos/adapters/repo/attestation_set.py`                                                             |
| attest                                        | 写下核验记录                               | `src/ethos/adapters/repo/git_effect_attestation.py`; film                                                |
| Commitment, Facts, TransitionPlan             | Commitment、Facts、TransitionPlan（不译）  | `docs/reference/glossary.md`; film                                                                       |
| kernel                                        | 内核                                       | `docs/concepts/kernel-model.md`; film                                                                    |
| Change (OpenSpec)                             | 正式变更                                   | `docs/reference/glossary.md`; film                                                                       |
| official (intent, Change)                     | 正式                                       | `src/ethos/adapters/openspec/commitment.py`; film                                                        |
| official (tool, archive)                      | 官方                                       | `src/ethos/adapters/openspec/cli.py`; film                                                               |
| intent                                        | 意图                                       | `src/ethos/adapters/openspec/lifecycle/intent.py`; film                                                  |
| fresh facts                                   | 当下的事实（强调观察时机时说“当场观察”）   | `docs/reference/glossary.md` (Facts); film                                                               |
| current facts                                 | 当前事实                                   | `src/ethos/adapters/mutation/decision.py`                                                                |
| change (to a repository) / mutate             | 改动                                       | `docs/architecture/runner-and-mutation.md`; film                                                         |
| Mutation decision                             | 改动决策                                   | `src/ethos/adapters/mutation/decision.py`                                                                |
| effect                                        | 改动                                       | `ethos-film` `content/narration.md` (核验记录“记下……一次改动”); `src/ethos/adapters/repo/git_effects.py` |
| admission / admit                             | 准入 / 放行（动词；身份用“核准”）          | `src/ethos/adapters/admission/`                                                                          |
| authority                                     | 决定权                                     | `src/ethos/adapters/admission/current/authority.py`; film                                                |
| verdict                                       | 判定                                       | `src/ethos/contracts/verdict.py`                                                                         |
| judge                                         | 判断                                       | `src/ethos/repository/policy/quality/`; film                                                             |
| proof / prove                                 | 证明                                       | `src/ethos/domain/prove.py`; film                                                                        |
| full proof                                    | 完整证明                                   | `src/ethos/adapters/gates/proof_slot.py`                                                                 |
| closure (of a plan)                           | 闭包                                       | `src/ethos/adapters/mutation/proof_validation.py`                                                        |
| gate                                          | 门禁                                       | `system/gates.toml`                                                                                      |
| Gate runner                                   | 门禁运行器                                 | `src/ethos/adapters/gates/runner.py`                                                                     |
| bounded readers, exclusive writers            | 只读门禁限量并行，写文件的门禁独占         | `src/ethos/adapters/gates/runner.py`                                                                     |
| load limit                                    | 负载上限                                   | `src/ethos/adapters/gates/proof_slot.py`                                                                 |
| floor (proof floor)                           | 底线                                       | `src/ethos/adapters/repo/gate_policy.py`                                                                 |
| obligation                                    | 责任                                       | `src/ethos/repository/policy/quality/`; film                                                             |
| source budget                                 | 源码预算                                   | `src/ethos/domain/source_budget/`                                                                        |
| native                                        | 原生                                       | `src/ethos/adapters/gates/native/`; film                                                                 |
| formatting, configuration, provenance (gates) | 格式、配置文件、出处                       | `src/ethos/adapters/gates/`                                                                              |
| evidence                                      | 证据                                       | `docs/reference/glossary.md`; film                                                                       |
| receipt                                       | 回执                                       | `src/ethos/adapters/gates/native/attempt.py`                                                             |
| custody                                       | 保管                                       | `src/ethos/adapters/store/`                                                                              |
| content-addressed                             | 内容寻址                                   | `src/ethos/adapters/mutation/lane_lifecycle/handoff/package.py`                                          |
| Work Lane                                     | 工作通道                                   | `docs/reference/glossary.md`; film                                                                       |
| lane                                          | 通道                                       | `src/ethos/adapters/mutation/lane_lifecycle/`                                                            |
| foreign lanes                                 | 他人的通道                                 | `src/ethos/adapters/repo/status/`                                                                        |
| Lease                                         | 租约                                       | `docs/reference/glossary.md`; film                                                                       |
| holder                                        | 持有者                                     | `src/ethos/adapters/mutation/lane_lifecycle/lease/`; film                                                |
| generation                                    | 代次                                       | `src/ethos/adapters/mutation/lane_lifecycle/lease/`; film                                                |
| expiry                                        | 到期时间                                   | `src/ethos/adapters/mutation/lane_lifecycle/lease/`; film                                                |
| handoff                                       | 交接                                       | `src/ethos/adapters/mutation/lane_lifecycle/handoff/`; film                                              |
| retirement / retire                           | 退役                                       | `src/ethos/adapters/mutation/lane_retirement/`                                                           |
| landed, superseded, absorbed, abandoned       | 已落地、被取代、被吸收、已放弃             | `src/ethos/contracts/retirement.py`; film                                                                |
| prewrite                                      | 写前准入                                   | `src/ethos/adapters/admission/prewrite.py`; film                                                         |
| tracked                                       | 受版本管理                                 | `src/ethos/adapters/admission/paths.py`; film                                                            |
| write order                                   | 写入顺序                                   | `docs/architecture/runner-and-mutation.md`                                                               |
| candidate (branch), candidate train           | 候选分支                                   | `docs/architecture/runner-and-mutation.md`; film                                                         |
| accepted / acceptance                         | 已验收 / 验收                              | `src/ethos/adapters/mutation/accepted/`                                                                  |
| land / landing                                | 落地                                       | `src/ethos/adapters/mutation/landing.py`                                                                 |
| closeout                                      | 收尾                                       | `src/ethos/domain/land/closeout.py`                                                                      |
| promote                                       | 提升                                       | `src/ethos/adapters/mutation/accepted/promotion.py`                                                      |
| Model Promotion                               | 模型提升                                   | `docs/reference/glossary.md`; film                                                                       |
| stale base                                    | 过时的基线                                 | `docs/architecture/runner-and-mutation.md`                                                               |
| replay                                        | 重放                                       | `docs/architecture/runner-and-mutation.md`                                                               |
| diverged (branch)                             | 分叉                                       | `docs/architecture/runner-and-mutation.md`                                                               |
| dirty                                         | 有未提交改动                               | `src/ethos/adapters/repo/dirty/`; film                                                                   |
| compensate                                    | 补偿                                       | `src/ethos/adapters/mutation/lane_lifecycle/archive/compensation.py`                                     |
| head (of a branch)                            | 头提交                                     | `src/ethos/adapters/mutation/landing.py`                                                                 |
| exact                                         | 精确（按语境也作“指定的”“这一个”“确定的”） | `src/ethos/adapters/repo/git_effects.py`                                                                 |
| ref                                           | 引用                                       | `src/ethos/adapters/admission/ref_move_policy.py`; film                                                  |
| ref intent                                    | 引用意图                                   | `src/ethos/adapters/repo/git_effect_admission.py`                                                        |
| compare-and-swap, CAS                         | compare-and-swap、CAS（不译）              | `docs/reference/glossary.md` (Exact CAS); film                                                           |
| repository                                    | 仓库                                       | film                                                                                                     |
| commit                                        | 提交                                       | `src/ethos/adapters/repo/commit/`; film                                                                  |
| commit grammar                                | 提交信息语法                               | `src/ethos/adapters/repo/commit/admission.py`                                                            |
| signature / signed                            | 签名 / 签名的                              | `src/ethos/adapters/mutation/accepted/signature.py`; film                                                |
| trust anchor                                  | 信任锚                                     | `src/ethos/adapters/repo/trust_anchor/`                                                                  |
| tag                                           | 标签                                       | `src/ethos/adapters/mutation/accepted/retag.py`; film                                                    |
| checkout                                      | 检出                                       | `src/ethos/adapters/repo/status/`                                                                        |
| worktree                                      | 工作区                                     | `src/ethos/adapters/mutation/worktree/`; film                                                            |
| hook                                          | 钩子                                       | `src/ethos/adapters/repo/hook/`; film                                                                    |
| runtime                                       | 运行时                                     | `src/ethos/adapters/repo/runtime/`                                                                       |
| Runtime generations                           | 分代运行时                                 | `src/ethos/adapters/repo/runtime/selection.py`                                                           |
| immutable                                     | 不可变                                     | `src/ethos/adapters/repo/runtime/manifest.py`                                                            |
| Git common directory                          | Git 公共目录                               | `src/ethos/adapters/store/state/`                                                                        |
| beside Git                                    | 存于 Git 旁                                | `docs/architecture/local-state.md`                                                                       |
| Forge                                         | 代码托管平台（语境明确时作“平台”）         | `src/ethos/repository/release/publication.py`; film                                                      |
| peer                                          | 平台                                       | `.ethos/release.toml`; film                                                                              |
| publication / publish                         | 平台发布 / 发布到平台                      | `src/ethos/adapters/mutation/publication/`                                                               |
| release                                       | 发布                                       | `src/ethos/repository/release/`; film                                                                    |
| Release identity                              | 发布身份                                   | `src/ethos/repository/release/`                                                                          |
| distribution                                  | 分发包                                     | `src/ethos/repository/release/`                                                                          |
| identity                                      | 身份                                       | `src/ethos/repository/policy/gates.py`                                                                   |
| push / atomic                                 | 推送 / 原子                                | `src/ethos/adapters/mutation/publication/execution.py`; film                                             |
| hosted jobs                                   | 托管作业                                   | `src/ethos/repository/release/publication.py`                                                            |
| surface                                       | 入口                                       | `src/ethos/surface/`                                                                                     |
| command plane                                 | `ethos` 命令                               | `docs/reference/command-plane.md`                                                                        |
| launcher                                      | 启动器                                     | `distributions/npm/`                                                                                     |
| MCP server                                    | MCP 服务器                                 | `src/ethos/surface/mcp/server.py`                                                                        |
| root-bound transport                          | 每个服务实例绑定一个仓库根目录             | `src/ethos/surface/mcp/server.py`                                                                        |
| project / projection                          | 投影（MCP 的 project 作“对外提供”）        | `src/ethos/adapters/projections/`; `docs/reference/glossary.md`                                          |
| skill                                         | 技能                                       | `src/ethos/resources/skills/`                                                                            |
| Agent                                         | Agent                                      | film                                                                                                     |
| contract                                      | 契约                                       | `src/ethos/contracts/`                                                                                   |
| schema                                        | Schema                                     | `system/schemas/`                                                                                        |
| typed values                                  | 带类型的值                                 | `src/ethos/contracts/value.py`                                                                           |
| policy                                        | 策略                                       | `src/ethos/repository/policy/`                                                                           |
| profile                                       | 配置档                                     | `src/ethos/repository/profile.py`; film                                                                  |
| paradigm                                      | 范式                                       | `src/ethos/repository/paradigm/`                                                                         |
| conformance                                   | 符合性                                     | `src/ethos/repository/audit.py`                                                                          |
| carrier                                       | 载体                                       | `src/ethos/adapters/mutation/carrier_edit.py`                                                            |
| preimage                                      | 修改前内容                                 | `src/ethos/adapters/mutation/carrier_edit.py`                                                            |
| Docs registry                                 | 文档注册表                                 | `src/ethos/repository/registry/`                                                                         |
| audit / finding                               | 审计 / 发现                                | `src/ethos/repository/audit.py`                                                                          |
| references (between carriers)                 | 引用关系                                   | `src/ethos/repository/policy/references/`                                                                |
| docstring                                     | 文档字符串                                 | `src/ethos/repository/policy/`                                                                           |
| artifact                                      | 产物                                       | `src/ethos/contracts/artifacts/`                                                                         |
| adoption / adopt / adopter                    | 接入 / 接入仓库                            | `src/ethos/repository/adoption/`; film                                                                   |
| form (a repository)                           | 建立                                       | `src/ethos/adapters/repo/adoption.py`                                                                    |
| starter                                       | 起始模板                                   | `src/ethos/adapters/repo/starter/`                                                                       |
| governed repository                           | 受治理的仓库                               | `src/ethos/repository/paradigm/`; film                                                                   |
| planning / plan                               | 规划 / 计划                                | `src/ethos/domain/plan.py`; film                                                                         |
| compile                                       | 编译                                       | `src/ethos/repository/policy/rules/compile.py`; film                                                     |
| resolve / resolution                          | 解析                                       | `src/ethos/adapters/admission/current/resolution.py`                                                     |
| Current resolution                            | 当前状态解析                               | `src/ethos/adapters/admission/current/`                                                                  |
| observe / observation                         | 观察                                       | `src/ethos/adapters/repo/git_effect_observation.py`; film                                                |
| gap                                           | 缺口                                       | `src/ethos/domain/status.py`; film                                                                       |
| next action                                   | 下一步                                     | `src/ethos/contracts/next_step.py`; film                                                                 |
| role                                          | 角色                                       | `src/ethos/adapters/mutation/branch_roles.py`                                                            |
| spec                                          | 规格                                       | `src/ethos/adapters/openspec/`; film                                                                     |
| archive                                       | 归档                                       | `src/ethos/adapters/mutation/lane_lifecycle/archive/`                                                    |
| relocation                                    | 迁移                                       | `src/ethos/adapters/openspec/relocation.py`                                                              |
| transition                                    | 转换                                       | `src/ethos/adapters/admission/transitions.py`                                                            |
| adapter                                       | 适配器                                     | `src/ethos/adapters/`; film                                                                              |
| host                                          | 主机                                       | `src/ethos/adapters/gates/proof_slot.py`                                                                 |
| validate                                      | 校验                                       | `src/ethos/adapters/mutation/proof_validation.py`                                                        |
| check                                         | 检查                                       | `src/ethos/repository/audit.py`; film                                                                    |
| select                                        | 选择                                       | `src/ethos/adapters/repo/runtime/selection.py`                                                           |
| plate / guide                                 | 图版 / 指南                                | Architecture Publisher edition                                                                           |
| evidence plane / proof plane                  | 证据层面 / 证明层面                        | `docs/governance/product-design-contract.md`                                                             |
| verify / verification                         | 检验                                       | `docs/governance/product-design-contract.md`; film                                                       |
| verifier                                      | 检验程序                                   | `docs/decisions/dr-0006-proof-trust-boundary.md`; film                                                   |
| independent verification                      | 独立检验                                   | `docs/governance/product-design-contract.md`                                                             |
| qualify / qualification                       | 鉴定                                       | `docs/architecture/mcp-server.md`                                                                        |
| reconciler                                    | 协调器                                     | `docs/governance/product-design-contract.md`                                                             |
| digest                                        | 摘要                                       | `src/ethos/contracts/plan.py`                                                                            |
| owner (of a concern)                          | 归属方                                     | `system/axioms.md`; `overview.typ`                                                                       |
| concern                                       | 关注点                                     | `system/axioms.md`                                                                                       |
| fail closed                                   | 存疑即阻止                                 | `system/axioms.md`                                                                                       |
| truth (repository truth)                      | 权威事实                                   | `docs/architecture/local-state.md`                                                                       |
| drift                                         | 漂移                                       | `docs/decisions/dr-0012-repository-paradigm.md`                                                          |
| decision record                               | 决策记录                                   | `docs/decisions/`                                                                                        |
| material (OpenSpec)                           | 材料                                       | `docs/architecture/adoption-profiles.md`                                                                 |
| linked worktree                               | 链接工作区                                 | `docs/architecture/local-state.md`                                                                       |
| packaged gate                                 | 内置门禁                                   | `docs/reference/command-plane.md`                                                                        |
| readiness gate; test and package gates        | 就绪门禁；测试与打包门禁                   | `docs/reference/command-plane.md`                                                                        |
| exact lease (push)                            | 精确的 `--force-with-lease`                | `src/ethos/adapters/mutation/publication/execution.py`                                                   |
| fast-forward                                  | 快进                                       | `docs/architecture/runner-and-mutation.md`                                                               |
| accepted branch                               | 已验收分支                                 | `docs/architecture/runner-and-mutation.md`                                                               |
| applied, failed, pending (peers)              | 已应用、失败、待定                         | `docs/architecture/runner-and-mutation.md`                                                               |
| application service                           | 应用服务                                   | `docs/plans/terminal-governance-product-design.md`                                                       |
| trust kernel                                  | 信任内核                                   | `docs/governance/product-design-contract.md`                                                             |
| host store                                    | 主机存储                                   | `docs/architecture/local-state.md`                                                                       |
