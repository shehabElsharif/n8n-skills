# Pharmacy Bot — 1. Triage Agent

This is a sophisticated, multi-agent triage system designed for a Libyan pharmacy. It handles customer identification, safety guardrails, and routes queries to specialized sub-agents.

## Status: **INACTIVE** (Development/Template)
- **ID**: `wT9WoymeZZumi-_qxO_Ye`
- **Nodes**: 22
- **Trigger**: Chat (n8n Chat Trigger)

## Overview
The Triage Agent acts as the central "brain" of the pharmacy bot. It ensures medical safety, identifies returning customers, and uses specialized tools (sub-workflows) to handle specific requests.

### Key Logic Steps:
1.  **Safety First**: Checks for emergency keywords (e.g., "chest pain", "overdose") and jailbreak attempts.
2.  **Customer Context**: Looks up clients in a Google Sheet. If found, it loads their health history, tone preference, and price sensitivity.
3.  **Intent Classification**: Categorizes the user's message into specific intents.
4.  **Agent Logic**: Uses an AI Agent with several specialized tools:
    - **Inventory Bot**: For prices and stock.
    - **Symptom Bot**: For health complaints and OTC advice.
    - **Complaint Bot**: For handling issues empatheticly.
    - **Sales Closing Bot**: For finalizing purchases with Libyan-adapted techniques.
5.  **Logging**: Records every conversation and updates client profiles in Google Sheets.

## Node-by-Node Breakdown (Partial List)

| Node Name | Type | Purpose |
| :--- | :--- | :--- |
| **Safety Keywords** | langchain.guardrails | Blocks emergency scenarios and redirects to human help. |
| **Client Lookup** | googleSheets | Retrieves customer data from the CRM sheet. |
| **Triage Agent** | langchain.agent | The main AI agent that decides which tool to call. |
| **Inventory Bot Tool** | langchain.toolWorkflow | Connects the agent to the inventory sub-workflow. |
| **Symptom Bot Tool** | langchain.toolWorkflow | Connects the agent to the health advice sub-workflow. |
| **Extract Tags** | base.set | Parses agent output for hidden system tags (e.g., `[REFER_DOCTOR]`). |
| **Log Conversation** | googleSheets | Saves the interaction for quality control. |
| **Update Client Profile**| googleSheets | Keeps the CRM up-to-date with new findings (names, health flags). |

## Usage
This workflow is intended to be the primary interface for pharmacy customers. It uses LLMs (via OpenRouter) to provide natural, dialect-aware conversation in Libyan Darija, Arabic, or English.
