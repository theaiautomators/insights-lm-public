#!/bin/bash

# Deploy all Supabase edge functions
echo "Deploying all Supabase edge functions..."

# Array of function names
functions=(
  "audio-generation-callback"
  "generate-audio-overview"
  "generate-note-title"
  "generate-notebook-content"
  "process-additional-sources"
  "process-document-callback"
  "process-document"
  "refresh-audio-url"
  "send-chat-message"
  "webhook-handler"
)

# Deploy each function
for func in "${functions[@]}"
do
  echo "Deploying function: $func"
  supabase functions deploy "$func"
  
  # Check if deployment was successful
  if [ $? -eq 0 ]; then
    echo "✓ Successfully deployed: $func"
  else
    echo "✗ Failed to deploy: $func"
  fi
  
  echo "---"
done

echo "All functions deployment completed!"