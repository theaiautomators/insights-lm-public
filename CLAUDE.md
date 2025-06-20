# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Development
- `npm run dev` - Start the development server (Vite)
- `npm run build` - Create production build
- `npm run build:dev` - Create development build
- `npm run preview` - Preview production build locally
- `npm run lint` - Run ESLint for code quality checks

## Architecture Overview

### Frontend (React + TypeScript)
The frontend is a React 18 application built with TypeScript and Vite:

- **Component Structure**: Components are organized by feature in `/src/components/`:
  - `ui/` - Reusable shadcn/ui components
  - `auth/` - Authentication flows
  - `chat/` - Chat interface components
  - `dashboard/` - Dashboard views
  - `notebook/` - Notebook generation and viewing
  
- **Routing**: Page components in `/src/pages/` with React Router
- **State Management**: React Context API (`/src/contexts/`) + React Query for server state
- **Services**: API interactions in `/src/services/` organized by domain
- **Styling**: Tailwind CSS with custom configuration in `tailwind.config.ts`

### Backend (Supabase + N8N)
The backend uses a serverless architecture:

- **Supabase Edge Functions** (`/supabase/functions/`):
  - Handle webhooks, document processing, audio generation, and chat
  - TypeScript-based serverless functions
  
- **N8N Workflows** (`/n8n/`):
  - Complex automation workflows for chat, text extraction, notebook generation
  - JSON workflow definitions that integrate with Supabase via webhooks

### Key Integration Points
- **Supabase**: PostgreSQL database, authentication, file storage, and edge functions
- **N8N**: Workflow automation triggered by Supabase webhooks
- **Frontend-Backend**: React Query for data fetching with Supabase client

### Database
- PostgreSQL via Supabase with migrations in `/supabase/migrations/`
- Key tables include users, documents, chats, and vector embeddings for RAG

## Development Notes
- No formal testing framework is currently implemented
- Uses ESLint for code quality but no pre-commit hooks
- Environment variables needed for Supabase and other services
- The project is designed for self-hosting with docker-compose support

## Deployment Notes
- Before deploying edge functions, add project ID to config.toml
- Run shell command to add edge functions to deployment configuration