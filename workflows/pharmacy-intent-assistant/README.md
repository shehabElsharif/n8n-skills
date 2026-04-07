# Pharmacy Intent Assistant

This workflow classifies incoming pharmacy chat messages and extracts product names for inventory lookup.

## Status: **ACTIVE**
- **ID**: `EyG4JUgGlMhKQy1o`
- **Nodes**: 9
- **Trigger**: Chat (n8n Chat Trigger)

## Overview
The assistant acts as an entry point for user queries. It:
1.  **Classifies** the message into categories (e.g., stock inquiry, location, diagnosis).
2.  **Routes** stock inquiries to an Extractor node.
3.  **Extracts** the product name using an LLM.
4.  **Checks Inventory** via Google Sheets.
5.  **Builds a Response** using product price and stock quantity from the sheet.

## Node-by-Node Breakdown

| Node Name | Type | Purpose |
| :--- | :--- | :--- |
| **Trigger** | n8n-nodes-langchain.chatTrigger | Receives incoming messages from the chat interface. |
| **Classifier1** | n8n-nodes-langchain.chainLlm | Uses AI to categorize the user's intent. |
| **nvidia** | n8n-nodes-langchain.lmChatOpenAi | LLM provider (DeepSeek v3.2 via NVIDIA) for classification. |
| **Switch1** | n8n-nodes-base.switch | Routes the flow based on the classification result. |
| **Extractor1** | n8n-nodes-langchain.chainLlm | AI node that isolates the medicine/product name from the message. |
| **Sheets1** | n8n-nodes-base.googleSheets | Looks up the extracted product in the "Inventory" sheet. |
| **Builder1** | n8n-nodes-langchain.chainLlm | Generates the final natural language response with price/stock data. |
| **Fallback1** | n8n-nodes-base.set | Provides a generic response for non-stock inquiries. |
| **OpenAI Hawana key** | n8n-nodes-langchain.lmChatOpenAi | Secondary AI provider (GPT-5 Nano) used across multiple nodes. |

## Usage
Users interact with this workflow via a chat interface. It is specifically tuned to recognize "stock/price inquiry about a product" and provide immediate data from the `Inventory` Google Sheet.
