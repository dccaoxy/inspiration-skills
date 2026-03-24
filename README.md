# Inspiration Skills - OpenClaw 灵感技能系列

🧠 完整的灵感处理生态系统，包含记录、研究和深度讨论三个核心技能。

---

## 🚀 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/dccaoxy/inspiration-skills.git

# 复制所有 skills 到你的 OpenClaw skills 目录
cp -r inspiration-skills/skills/* \
   ~/.openclaw/data-analysis-workspace/skills/

# Windows PowerShell
Copy-Item -Recurse inspiration-skills/skills/* \
  ~/.openclaw/data-analysis-workspace/skills/
```

### 重启 OpenClaw

```bash
openclaw gateway restart
```

---

## 📦 包含的技能

| 技能 | 功能 | 触发词 | 存储位置 |
|------|------|--------|---------|
| 💡 **inspiration-record** | 灵感记录 | "帮我记录"、"记一下"、"/remember" | `memory/inbox/` |
| 🔬 **inspiration-research** | 深度研究 | "深度研究"、探索性问题 | `memory/reports/` |
| 💬 **inspiration-deep-discussion** | 深度讨论 | "想讨论一下"、"聊聊" | `memory/discussions/` |

---

## 📖 技能详解

### 1️⃣ inspiration-record（灵感记录）

**用途**：快速记录想法、创意、会议笔记、学习目标

**触发方式**：
- "帮我记录一个想法：..."
- "记一下：..."
- "/remember ..."
- "灵感记录：..."

**功能特点**：
- ✅ 自然语言输入
- ✅ 自动标签分类
- ✅ 语义检索
- ✅ 智能关联召回
- ✅ 自动研究触发（检测到探索性问题时调用 inspiration-research）

**存储结构**：
```
memory/
├── inbox/           # 新记录（未整理）
│   ├── 💡_2026-02-26-0015.md
│   └── 📋_2026-02-25-1430.md
├── weekly/          # 每周整理归档
└── reports/         # 报告文件
```

**使用示例**：
```
帮我记录一个想法：算力平权是未来趋势，数据才是核心竞争力
标签：#AI #战略 #产品创意
```

---

### 2️⃣ inspiration-research（灵感深度研究）

**用途**：自动拆解灵感问题，搜索相关资料，生成结构化研究报告

**触发方式**：
- "记录灵感"
- "深度研究"
- 直接发送思考内容（包含探索性问题）

**报告格式**：
1. 原始灵感记录
2. 核心问题拆解
3. 参考资料与思考映射
4. 我的思考与建议
5. 下一步行动

**工作流程**：
```
接收灵感 → 拆解问题 → 搜索验证 → 建立映射 → 生成报告
```

**使用示例**：
```
如果算力平权了，企业的核心竞争力是什么？
```

**输出**：生成完整的研究报告到 `memory/reports/`

---

### 3️⃣ inspiration-deep-discussion（深度讨论）

**用途**：与用户进行深度话题讨论（多轮对话，不是单向输出）

**触发方式**：
- "想讨论一下..."
- "聊聊..."
- "帮我分析一下..."
- "不是记录灵感"

**核心方法论**：
- ✅ 每次只问 1-2 个问题
- ✅ 跳出用户思维框架提问
- ✅ 主动搜索已有灵感（关联记忆）
- ✅ 使用 memory 目录存储讨论记录
- ✅ 回归第一性原理

**6 个讨论阶段**（灵活运用）：
1. 了解背景
2. 定义目标
3. 深入场景
4. 引入新视角
5. 关联已有思考
6. 总结与行动

**使用示例**：
```
想讨论一下 AI 时代 C 端产品的销售模式会不会变化
```

---

## 🔄 三者关系

```
用户想法
   ↓
inspiration-record（记录）
   ↓
inspiration-research（研究）
   ↓
inspiration-deep-discussion（讨论）
   ↓
新的灵感记录（循环）
```

形成一个**完整的灵感处理闭环**！

---

## 📁 文件结构

```
inspiration-skills/
├── README.md                 # 本文件
├── LICENSE                   # MIT 协议
├── .gitignore               # Git 忽略
├── install.ps1              # 安装脚本
└── skills/
    ├── inspiration-record/
    │   ├── SKILL.md
    │   └── scripts/
    │       └── record_inspiration.py
    ├── inspiration-research/
    │   └── SKILL.md
    └── inspiration-deep-discussion/
        └── SKILL.md
```

---

## 🛠️ 技术细节

### 使用的工具

| 工具 | 用途 |
|------|------|
| `memory_search` | 语义检索已有灵感 |
| `memory_get` | 读取记忆文件 |
| `web_search` | 搜索资料（Brave Search API） |
| `write` | 写入记忆文件 |

### 记忆系统结构

```
memory/
├── inbox/              # 新灵感（未整理）
├── weekly/             # 每周归档
├── reports/            # 研究报告
├── discussions/        # 深度讨论记录
├── MEMORY.md           # 长期记忆
└── README.md           # 记忆系统说明
```

---

## ❓ 常见问题

### Q1: 三个技能如何协同工作？

**A**: 它们形成一个闭环：
1. 用户记录灵感 → inspiration-record
2. 如果有探索性问题 → 自动触发 inspiration-research
3. 如果需要深入讨论 → 触发 inspiration-deep-discussion
4. 讨论产生新想法 → 再次记录到 inspiration-record

### Q2: 灵感存储在哪里？

**A**: 存储在 `memory/` 目录：
- 新记录：`memory/inbox/`
- 研究报告：`memory/reports/`
- 讨论记录：`memory/discussions/`
- 长期记忆：`MEMORY.md`

### Q3: 如何检索历史灵感？

**A**: 使用语义检索：
- 技能会自动搜索相关灵感
- 基于标签、内容、时间多维度匹配
- 新灵感与历史灵感有交叉时自动提醒

---

## 📄 许可证

MIT License

本技能系列采用 MIT 开源协议，你可以自由使用、修改和分发。

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

仓库地址：https://github.com/dccaoxy/inspiration-skills

---

## 📞 联系方式

- **GitHub**: [@dccaoxy](https://github.com/dccaoxy)
- **OpenClaw 社区**: [Discord](https://discord.com/invite/clawd)

---

**Made with ❤️ for OpenClaw**
