#!/bin/bash

# Set Supabase Edge Function secrets
echo "Setting Supabase Edge Function secrets..."

# Project configuration
SUPABASE_PROJECT_REF="YOUR_PROJECT_ID"  # Replace with your Supabase project ID

# Required secrets for all functions
echo "Setting SUPABASE_URL..."
supabase secrets set SUPABASE_URL="https://${SUPABASE_PROJECT_REF}.supabase.co"

echo ""
echo "IMPORTANT: You need to manually set these secrets:"
echo ""
echo "1. SUPABASE_SERVICE_ROLE_KEY"
echo "   Get this from your Supabase dashboard > Settings > API"
echo "   Run: supabase secrets set SUPABASE_SERVICE_ROLE_KEY=\"your-service-role-key-here\""
echo ""

# N8N webhook URLs (fixed double slashes)
echo "Setting N8N webhook URLs..."
supabase secrets set AUDIO_GENERATION_WEBHOOK_URL="https://N8N_URL/webhook/373ddd4a274e"
supabase secrets set NOTEBOOK_CHAT_URL="https://N8N_URL/webhook/9150e9ce7d6c"
supabase secrets set ADDITIONAL_SOURCES_WEBHOOK_URL="https://N8N_URL/webhook/4792256af985"
supabase secrets set DOCUMENT_PROCESSING_WEBHOOK_URL="https://N8N_URL/webhook/5203c2b663b7"
supabase secrets set NOTEBOOK_GENERATION_URL="https://N8N_URL/webhook/5f7cfca9efe2"

echo ""
echo "2. NOTEBOOK_GENERATION_AUTH"
echo "   Use the password you created for N8N authentication"
echo "   Run: supabase secrets set NOTEBOOK_GENERATION_AUTH=\"your-n8n-password\""
echo ""

echo "3. OPENAI_API_KEY"
echo "   Your OpenAI API key for AI features"
echo "   Run: supabase secrets set OPENAI_API_KEY=\"sk-your-openai-api-key\""
echo ""

echo "To view all secrets: supabase secrets list"
echo ""
echo "NOTE: Ensure FFMPEG is installed for podcast audio generation to work"