# Skill Maker

这份文档是用于生成高质量人物/视角类 skill 的基线方法，参照对象是 `person-centered-perspective` 这一类 skill。

它不是人物传记写作指南，也不是泛泛的 prompt 写作指南。
它是一套制作方法，用来构建一个真正能够影响 skill 触发、思考方式、说话方式，以及边界约束的 skill。

## 核心思路

一个好的视角类 skill，应该按以下顺序构建：

1. 触发面
2. 整体人格 grounding
3. 核心信念
4. 张力与边界
5. 对话模式
6. 示例库
7. 安全边界

不要只从“语气风格”开始。
如果一个 skill 只有风格，它最后会变得表演化、空洞，或者带有操控感。
模型必须先得到一个“像人”的内部结构，才能稳定地产生可信的对话方式。

## 不可妥协的原则

- 必须优先使用一手材料。
- 尽量使用人物本人的原话。
- 对话风格必须从 worldview 和 lived experience 推导出来，而不是从网络总结里拼出来。
- 主 skill 文件要足够精炼，能够被加载；但又必须足够具体，能够约束行为。
- 详细示例应放在 `references/examples.md`，不要全部堆进 `SKILL.md`。
- 必须同时规定“该做什么”和“绝不能做什么”。
- 触发范围必须有意识地定义宽或窄，不能模糊不清。
- 必须保留人物内部的张力和矛盾，不能把人抹平成一个品牌。

## 材料来源的优先级

来源优先级应如下：

1. 本人著作
2. 自传性材料、回忆录、书信、日记、演讲、访谈、发言
3. 能展示本人实时回应方式的逐字对话或转录
4. 只有在需要补充年代、背景、脉络时，才使用经过筛选的二手研究

不要用以下材料来构建这种 skill：

- 随机网络摘要
- 列表体人格总结
- 社交媒体二手转述
- “X 的思想十条”这类简化帖子
- 把人物扁平化的敌意评论或崇拜性评论

对这类 skill，理想的基础材料是：

- 一本主要著作
- 如果有的话，一份自传性或高度自我揭示的材料
- 如果有的话，一份访谈或对话语料

如果这个 skill 是要用于塑造 live response，那么直接对话材料尤其重要。

## 必备工作流程

### 第一步：先定义真实使用场景

在开始写之前，先回答：

- 这个 skill 会在什么类型的对话里触发？
- 它要创造出一种什么样的 presence？
- 它要替代或阻止什么倾向？
- 它绝不能滑向什么样的交流方式？

这一步直接决定 `description`。
如果 `description` 很弱，那么即使正文写得很好，这个 skill 也可能根本不会被触发。

### 第二步：读材料时，抓结构，不抓八卦

在阅读材料时，要抽取四层内容：

1. 塑造人格的关键经历
2. 稳定的核心信念
3. 有生产力的张力或矛盾
4. 重复出现的回应模式

不要因为某个事实“有趣”就收集它。
只保留那些真正能解释这个人如何感知、如何判断、如何回应、如何拒绝的材料。

### 第三步：建立证据账本

在开始写 skill 之前，先整理：

- 某个事件 -> 它为什么重要
- 某句原话或某个段落 -> 它支撑了什么原则
- 某个对话动作 -> 它适用于什么场景
- 某种反模式 -> 它应该阻止模型做什么

如果某段材料无法连接到上述任何一种功能，它大概率不该进入 skill。

### 第四步：按正确顺序起草 `SKILL.md`

这类 skill 的正确顺序是：

1. YAML frontmatter
2. 简短的 orientation
3. 明确指示去读 `references/examples.md`
4. The Person
5. Communication Mode
6. Safety Override

其中，`The Person` 内部的正确顺序是：

1. Early formation / background
2. Core human vision / governing beliefs
3. Tensions and contradictions
4. 如果相关，再写更广泛的社会/文明延伸

其中，`Communication Mode` 内部的正确顺序是：

1. Core orientation
2. Working model
3. Response algorithm
4. What to do
5. What not to do
6. Language characteristics
7. Safety override

这个顺序很重要。
背景必须先于方法。
方法必须先于措辞。
示例必须服务于方法，而不是替代方法。

## 必备文档结构

每一个这种类型的 skill，都应包含以下内容：

### 1. 强 frontmatter

必需字段：

- `name`
- `description`

`description` 必须承担真正的路由作用。
它应明确说明：

- 什么对话会触发这个 skill
- 它默认创造什么 stance
- 哪些类型的对话不该触发它
- 如果有必要，也可以写明确的触发词

要把 `description` 当成“给系统做检索和路由的元数据”，而不是写给人看的介绍文案。

### 2. Orientation 段落

这一段要回答：

- 这个 skill 要呈现出怎样的人/存在感
- 这个 skill 是干什么的
- 这个 skill 不是什么

这一段要短。

### 3. 明确的 references 指针

在文件顶部附近，必须明确写出要查看 `references/examples.md`。

原因是：

- `SKILL.md` 负责承载运行结构
- `references/examples.md` 负责承载示例库
- 模型必须被显式提醒：这个示例库存在，并且应该去看

### 4. The Person

这一部分是强制项。
没有这一部分，skill 就会退化成空洞的风格模仿。

这一节必须包含：

- 有意义的形成性经历
- 这个人的稳定 worldview
- 防止人物被抹平的张力
- 如果相关，这种 stance 如何超出单一领域向外延伸

#### Early formation

这一节不能写得模糊。
必须指向具体事件、具体环境、具体转折、具体选择。

好的写法：

- 家庭氛围，但带具体约束
- 教育路径中的转向
- 改变观念的旅行或经历
- 决定性关系
- 改变职业方向的经验
- 具体失败的方法，如何改变了他后来的方式

差的写法：

- “X 很重视自由”
- “Y 受到了人生经验影响”
- “后来他变得更独立了”

检验标准很简单：
读完之后，读者能否理解这个人为什么会变成这种回应者？
如果不能，说明背景仍然太抽象。

#### Core vision

这一节要提炼出少量真正稳定的支配性信念。

好的做法：

- 尽量用人物自己的话
- 如果某句原话非常关键，可以保留短引文
- 改写只能用于压缩，不能用于加戏

不要把这一节写成一大段哲学讲义。
只保留那些真正会塑造 live interaction 的信念。

#### Tensions and contradictions

这一节是 realism 的必要条件。

它可以防止 skill 退化成：

- 宣传品
- 同人文
- 励志鸡汤
- 单一口号式人格

好的张力示例：

- 相信经验，但尊重科学
- 重视自由，但不是空洞相对主义
- 温暖，但不纵容
- 直接，但不强迫

### 5. Communication mode

只有在人物已经清楚之后，才进入“他如何回应”。

这一节的任务，是把 worldview 翻译成可操作的对话行为。

它应该包括：

- 这个人主要听什么
- 他如何压缩和提炼
- 他如何表达不确定性
- 他如何打开，或不打开，对话
- 他倾向什么程度的简洁
- 他典型的回应结构是什么

如果适合，可以加入 response algorithm。
当某种风格很细腻、很容易被模型扭曲时，这一点尤其重要。

### 6. Do / Do Not Do

这两部分不是可选项。

`What To Do` 应该规定：

- 要注意什么
- 要保留什么
- 不确定时优先做什么
- 哪种回应形态通常更强

`What Not To Do` 应该阻止：

- 过度解释
- 机械安慰
- 过早给建议
- 操控性提问
- 理论灌输
- 煽情
- 不合适的诊断
- genre drift

以 person-centered 这一类为例，skill 必须明确阻止：

- 猜测性问题
- 引导性问题
- 为了挖掘“隐藏动机”而钓鱼
- 用问题把用户往比他当前更快的速度推

### 7. Language characteristics

这一节必须放在行为规则之后。

它应该描述：

- 句长
- 术语密度
- 试探性的程度
- 第一人称还是第二人称的使用偏好
- 是否保留用户的比喻和意象
- 是否允许极短回应

不要把语言特征误当成 skill 的本体。
这些只是最后一层表面约束，不是根基。

### 8. Safety override

如果这个 skill 用于有情感重量的交流，就必须有明确的 safety override。

要清楚写明，在什么情况下，这种风格必须让位于：

- 危机应对
- 引导真实世界支持
- 更直接、更明确的介入

## 示例库设计

`references/examples.md` 对这类 skill 来说是必需的。

示例库不能只是随手摘抄的 quotes dump。
它必须是一个可索引、可调用的训练面。

每个 example 应包含：

- title
- type
- use
- what to imitate
- do not stretch
- example
- source

推荐的顶层组织方式：

- Dialogue Examples
- Principle Examples

二者都重要：

- dialogue examples 展示 live response 的实际形态
- principle examples 解释这种形态背后的原则

如果没有 dialogue examples，模型会变得很抽象。
如果没有 principle examples，模型就会只模仿表面句式，而不理解为什么要这么说。

### 示例编写规则

- 优先选短但决定性的片段。
- 每个示例只教一个动作，不要一个示例教十件事。
- 必须始终包含 `Do not stretch`。
- 必须提供足够的 source 信息，以便后续回查。
- 必须保留这个示例的适用边界，不要把它过度泛化。

## Skill 本体的写作风格规则

在写 skill 本身时：

- 优先使用清晰、直接的陈述句。
- 避免学术腔堆砌。
- 避免营销语言。
- 避免对人物的夸张崇拜。
- 避免没有锚点的空泛抽象。
- 优先使用可执行措辞：`Do X`、`Prefer Y`、`Do not Z`。

对这类 persona skill 来说，正文应该像：

- 一份有纪律的 operating portrait
- 而不是传记章节
- 不是致敬文章
- 不是粉丝作品

## 如何处理引文

- 只保留真正关键、足够有辨识度的句子。
- 优先选概念密度高的短引文。
- 每个引文都要解释它为什么重要。
- 不要把整个文件写成引文堆。
- 引文是用来锚定原则的，不是拿来逃避分析的。

## 这种 skill 为什么会有效

`person-centered-perspective` 之所以有效，是因为它同时具备：

- 有意识设计过的宽触发面
- 一个完整的人物画像
- 少量但稳定的核心信念
- 明确的内部张力
- response algorithm
- 很强的 do / don't 边界
- 单独的 example bank
- 细致的反操控约束

如果缺了其中任何一项，就会出现典型失败模式：

- 缺背景 -> 空洞的风格扮演
- 缺信念 -> 只剩模糊的温暖
- 缺张力 -> 退化成口号
- 缺 do/don't -> 漂移、污染
- 缺 examples -> 模仿脆弱
- description 太弱 -> 根本不触发

## 验证清单

在宣布 skill 完成前，必须检查：

- `description` 是否足够清楚地决定触发条件？
- 文件顶部是否明确提醒查看 `references/examples.md`？
- 背景是否真正解释了这个人为什么会变成这样？
- 是否有具体形成性事件，而不是模糊人生总结？
- 核心信念是否少而真，且有来源支撑？
- 张力是否被保留下来？
- communication mode 是否确实从信念自然流出？
- 是否有明确的反模式约束？
- 是否允许在适当时刻给出简短回应？
- 示例库是否同时覆盖 dialogue 和 principle？
- safety override 是否明确标出何时这种风格不再适用？

如果其中有几项答案是否定的，那么这个 skill 还没有完成。

## 推荐构建顺序

建议使用以下顺序：

1. 收集一手文本
2. 阅读并提取经历、信念、张力、回应模式
3. 建立 passage/function note ledger
4. 先写 `description`
5. 再写 `SKILL.md` 的顶层结构
6. 先写 `The Person`，后写 `Communication Mode`
7. 写 `What To Do` 和 `What Not To Do`
8. 构建 `references/examples.md`
9. 在文件顶部加入示例库指针
10. 用真实 prompt 测试 skill
11. 收紧模糊段落，删除低价值材料

## 反模式

不要用以下方式生成这种 skill：

- 从网络摘要起手
- 过度拟合“声音”，却没有 worldview
- 写成长篇传记，却没有操作后果
- 只有 response algorithm，没有 personhood
- 只有哲学，没有对话方法
- 没有 example bank
- 只有正向要求，没有负向边界
- 触发条件过于模糊，无法路由，或过于狭窄，失去实用性

## 最小交付物

对这个 family 的新 skill，最低可接受交付物是：

- `SKILL.md`
- `references/examples.md`

并且 `SKILL.md` 必须包含：

- 具备强 `description` 的 frontmatter
- orientation
- 明确指向 `references/examples.md`
- 背景 / formative experiences
- 核心信念
- 张力
- communication mode
- do / do not do
- language characteristics
- safety override

如果这些元素齐全，并且都能回到材料来源上，那么这个 skill 通常就会真正可用。
如果缺失这些元素，它可能“看起来像一个 skill”，但在实际运行中会失败。
