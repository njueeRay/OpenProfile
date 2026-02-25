<div align="center">

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&pause=1000&color=00B4D8&center=true&vCenter=true&width=600&lines=OpenProfile+%E2%80%94+AI-Native+GitHub+Profile;Built+with+GitHub+Copilot+Agents;Open+Source+%7C+Reproducible+%7C+Extensible)](https://git.io/typing-svg)

[![Stars](https://img.shields.io/github/stars/njueeRay/OpenProfile?style=flat-square&color=gold)](https://github.com/njueeRay/OpenProfile/stargazers)
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](./LICENSE)
[![Built with Copilot](https://img.shields.io/badge/Built%20with-GitHub%20Copilot-0078d4?style=flat-square&logo=github)](https://github.com/features/copilot)
[![Visit Site](https://img.shields.io/badge/Visit%20My%20Profile-njueeray.github.io-00b4d8?style=flat-square&logo=safari)](https://njueeray.github.io)

</div>

---

## What is OpenProfile?

**OpenProfile** is both a working GitHub Profile configuration and an open-source template that demonstrates how to build and maintain a developer profile using a **GitHub Copilot Agent team**.

Instead of tweaking Markdown by hand, you delegate tasks to specialized Agents — a designer, a writer, a researcher, and a reviewer — each with its own role, tools, and scope. This repo is the exact setup that powers [@njueeRay](https://github.com/njueeRay)'s profile, shipped as a reusable starting point for anyone who wants an AI-Native workflow.

> **Two things at once:** a live profile you can visit, and a template you can fork.

<div align="center">

[![Visit My Profile →](https://img.shields.io/badge/%F0%9F%9A%80%20Visit%20My%20Profile%20%E2%86%92-njueeray.github.io-00b4d8?style=for-the-badge&logo=safari)](https://njueeray.github.io)

</div>

---

## Agent Team Architecture

Four specialized Agents collaborate in a pipeline. You stay in the loop only for goals and final approval.

```
You (goal & decision)
        │
        ▼
┌─────────────────────┐
│  profile-designer   │  Visual architect — layout, component selection
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│   content-writer    │  Code engineer — turns designs into Markdown
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│    qa-reviewer      │  Quality gate — 6-dimension review checklist
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│     researcher      │  Intel officer — deep dives without burning context
└─────────────────────┘
```

| Agent | Role | Trigger |
|-------|------|---------|
| `profile-designer` | Plans visual layout; outputs design doc, never touches README directly | Before any major redesign |
| `content-writer` | Writes actual Markdown/SVG/badge code | After design is approved |
| `researcher` | Audits third-party components, benchmarks profiles | When evaluating new tools |
| `qa-reviewer` | Validates links, themes, mobile layout, load time | Before every merge |

Agent instructions live in [`.github/agents/`](.github/agents/).

---

## Quick Start

Replicate this workflow in 3 steps:

**Step 1 — Fork & personalize**

```bash
# Fork this repo, then clone it
git clone https://github.com/YOUR_USERNAME/OpenProfile.git
cd OpenProfile
```

Open [`.github/copilot-instructions.md`](.github/copilot-instructions.md) and replace the `Personal Info` block with your own data (username, role, tech stack, links).

**Step 2 — Activate Copilot Agents in VS Code**

Make sure [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) is installed. Open the Copilot Chat panel, switch to **Agent mode**, and reference one of the Agent files:

```
@workspace #file:.github/agents/profile-designer.agent.md
Design my profile header section.
```

**Step 3 — Push to your `<username>/<username>` repo**

GitHub automatically renders `<username>/README.md` as your profile page. Push your changes and visit `github.com/<username>` to see the result.

```bash
git add README.md
git commit -m "feat: initialize profile with OpenProfile template"
git push origin main
```

---

## File Structure

```
OpenProfile/
├── .github/
│   ├── copilot-instructions.md        ← Global Agent config (start here)
│   ├── agents/
│   │   ├── profile-designer.agent.md  ← Visual architect Agent
│   │   ├── content-writer.agent.md    ← Markdown engineer Agent
│   │   ├── researcher.agent.md        ← Research-only Agent
│   │   └── qa-reviewer.agent.md       ← QA checklist Agent
│   ├── ISSUE_TEMPLATE/                ← Bug / feature templates
│   └── PULL_REQUEST_TEMPLATE.md
├── .vscode/
│   ├── mcp.json                       ← MCP server config for Agents
│   └── settings.json
├── docs/
│   ├── design-decisions.md            ← Why things look the way they do
│   ├── component-guide.md             ← Dynamic component reference
│   └── agent-workflow.md              ← Full AI workflow documentation
├── CONTRIBUTING.md
├── CHANGELOG.md
└── LICENSE
```

---

## Tech Stack

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![C++](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=cplusplus&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white)
![GitHub Copilot](https://img.shields.io/badge/GitHub%20Copilot-0078d4?style=flat-square&logo=github&logoColor=white)

---

## Documentation

| Document | Description |
|----------|-------------|
| [docs/agent-workflow.md](docs/agent-workflow.md) | Full AI-Native workflow explanation |
| [docs/component-guide.md](docs/component-guide.md) | Dynamic badge & stats component reference |
| [docs/design-decisions.md](docs/design-decisions.md) | Rationale behind visual choices |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute to this project |
| [CHANGELOG.md](CHANGELOG.md) | Version history |

---

## License

MIT © [njueeRay](https://github.com/njueeRay) — see [LICENSE](./LICENSE) for details.

Feel free to fork, adapt, and ship your own AI-Native profile.
Contributions welcome — read [CONTRIBUTING.md](CONTRIBUTING.md) to get started.
