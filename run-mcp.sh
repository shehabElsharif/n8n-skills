#!/bin/bash

# Load environment variables from .env file if it exists
if [ -f .env ]; then
  # Sourcing .env assuming it's in KEY=VALUE format
  # We use a subshell to avoid polluting the current shell if needed, 
  # but here we want the variables for the node command.
  export $(grep -v '^#' .env | xargs)
fi

# Run the MCP server
node /home/isp/hana/n8n/node_modules/n8n-mcp/dist/mcp/index.js
