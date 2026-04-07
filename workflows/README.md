# n8n Workflows Index

This directory contains technical documentation and JSON exports for the active workflows in this n8n instance.

## 🚀 Active Workflows
Workflows currently running and serving requests.

| Workflow Name | Purpose | Link |
| :--- | :--- | :--- |
| **Pharmacy Intent Assistant** | Classifies chat messages and extracts product names for inventory. | [View Docs](./pharmacy-intent-assistant/README.md) |

---

## 🛠️ Development & Templates
Workflows in development or used as sub-routines.

| Workflow Name | Purpose | Link |
| :--- | :--- | :--- |
| **Pharmacy Bot — 1. Triage Agent** | Advanced multi-agent triage with safety guardrails and CRM lookup. | [View Docs](./pharmacy-triage-agent/README.md) |

---

## 📂 Structure
Each workflow directory contains:
1.  `README.md`: Technical explanation, node breakdown, and logic flow.
2.  `workflow.json`: Full n8n export (importable via the UI).
