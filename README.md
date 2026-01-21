# Smart Healthcare AI Platform

A secure, role-based healthcare assistant built on Antigravity with LLM integration.

## Architecture

```
Frontend (Web / App)
        ↓
Antigravity Backend
        ↓
Role Logic + Data
        ↓
LLM (Gemini / OpenAI)
        ↓
Safe AI Response
```

## Project Structure

```
healthcare-platform/
├── backend/
│   ├── database/          # Database schema definitions
│   ├── functions/         # Antigravity AI functions & role logic
│   ├── prompts/           # System and role-based prompts
│   └── api/               # API endpoints
├── frontend/              # Frontend integration code
├── config/                # Configuration files
└── README.md
```

## Quick Start

1. **Antigravity Setup**: Create new project "Smart Healthcare AI Platform"
2. **Database**: Import schemas from `backend/database/`
3. **LLM Integration**: Configure API keys in `config/antigravity.config.json`
4. **Functions**: Deploy functions from `backend/functions/`
5. **Frontend**: Connect using endpoints from `backend/api/`

## Key Features

- ✅ Role-based LLM control (Patient, Doctor, Caretaker, Admin)
- ✅ Secure health data management
- ✅ Emergency detection system
- ✅ Privacy-first design
- ✅ No medical diagnosis or prescriptions

## Roles

- **Patient**: Access personal health data, ask questions
- **Doctor**: Access patient data, provide guidance
- **Caretaker**: Monitor patients, receive alerts
- **Admin**: System management, user control

## API Reference

See `backend/api/` for endpoint documentation.

## Security & Compliance

- All LLM responses are controlled via system prompts
- Role-based data access control
- Emergency keywords trigger safety protocols
- HIPAA-ready architecture
