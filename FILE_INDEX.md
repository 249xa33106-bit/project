# 📁 File Structure & Navigation Guide

## 🗂️ Complete File Listing

### Root Level Documentation
```
healthcare-platform/
├── README.md                          ← START HERE (Project Overview)
├── DEPLOYMENT_GUIDE.md                ← Step-by-step setup (65 mins)
├── JUDGES_GUIDE.md                    ← Demo & presentation tips
├── IMPLEMENTATION_SUMMARY.md          ← What's been built summary
├── QUICKSTART.sh                      ← Quick reference checklist
└── FILE_INDEX.md                      ← This file
```

---

## 🗄️ Backend Structure

### Database
```
backend/database/
└── schema.sql                         ← Complete HIPAA-ready schema
                                         Tables:
                                         - Users (role-based)
                                         - PatientHealthData (vitals, meds)
                                         - Alerts (emergency detection)
                                         - ConversationLog (audit trail)
                                         - Appointments
```

### Prompts
```
backend/prompts/
├── systemPrompts.js                   ← All 5 prompt types:
│                                         - SYSTEM_PROMPT (base rules)
│                                         - PATIENT_PROMPT
│                                         - DOCTOR_PROMPT
│                                         - CARETAKER_PROMPT
│                                         - ADMIN_PROMPT
│                                         - EMERGENCY_PROMPT
│
└── promptManager.js                   ← Orchestrates prompts:
                                         - getRolePrompt()
                                         - buildLLMPrompt()
                                         - detectEmergency()
                                         - buildLLMPayload()
```

### Functions (Backend Logic)
```
backend/functions/
├── llmIntegration.js                  ← LLM client setup:
│                                         - Gemini support
│                                         - OpenAI support
│                                         - sendToLLM()
│
├── healthcareAIFunction.js            ← MAIN ORCHESTRATOR:
│                                         - processHealthcareQuery()
│                                         - Authorization checks
│                                         - Patient data fetching
│                                         - LLM integration
│                                         - Audit logging
│
├── roleBasedLogic.js                  ← Access control:
│                                         - ROLES definitions
│                                         - hasPermission()
│                                         - canAccessPatientData()
│                                         - filterDataByRole()
│                                         - logDataAccess()
│
└── emergencyDetection.js              ← Safety system:
                                         - detectEmergency()
                                         - getEmergencyResponse()
                                         - createEmergencyAlert()
                                         - handleEmergencyWorkflow()
```

### API Layer
```
backend/api/
├── endpoints.js                       ← API definitions:
│                                         - POST /api/v1/chat
│                                         - GET /api/v1/patients/:id/health-data
│                                         - POST /api/v1/alerts
│                                         - GET /api/v1/users/:id/role
│                                         - POST /api/v1/conversation/start
│                                         - GET /api/v1/conversation/:id/history
│                                         - GET /api/v1/health-check
│
└── handlers.js                        ← Request handlers:
                                         - handleChatRequest()
                                         - handleGetPatientData()
                                         - handleCreateAlert()
                                         - handleGetUserRole()
```

---

## 🎨 Frontend Structure

```
frontend/
├── client.js                          ← JavaScript SDK:
│                                         class HealthcareAIClient
│                                         - sendMessage()
│                                         - getPatientHealthData()
│                                         - startConversation()
│                                         - getConversationHistory()
│                                         - getUserRole()
│                                         - createAlert()
│
└── ChatComponent.jsx                  ← React UI Component:
                                         - HealthcareChatComponent
                                         - Message display
                                         - Emergency handling
                                         - User authentication
                                         - Responsive design
                                         - CSS styles included
```

---

## ⚙️ Configuration

```
config/
└── antigravity.config.json            ← Main configuration:
                                         - LLM provider settings
                                         - API keys
                                         - Temperature & token settings
                                         - Security settings
                                         - Emergency keywords
```

---

## 📖 How to Navigate

### For Setup & Deployment
1. **Start:** [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) (Complete 7-phase setup)
2. **Reference:** [config/antigravity.config.json](config/antigravity.config.json) (Configuration)
3. **Database:** [backend/database/schema.sql](backend/database/schema.sql) (Schema)
4. **Verify:** [QUICKSTART.sh](QUICKSTART.sh) (Checklist)

### For Understanding Architecture
1. **Overview:** [README.md](README.md) (High-level architecture)
2. **Main Flow:** [backend/functions/healthcareAIFunction.js](backend/functions/healthcareAIFunction.js) (Orchestrator)
3. **Prompts:** [backend/prompts/systemPrompts.js](backend/prompts/systemPrompts.js) (All prompts)
4. **Security:** [backend/functions/roleBasedLogic.js](backend/functions/roleBasedLogic.js) (Access control)
5. **Emergency:** [backend/functions/emergencyDetection.js](backend/functions/emergencyDetection.js) (Safety system)

### For Frontend Integration
1. **SDK:** [frontend/client.js](frontend/client.js) (JavaScript client)
2. **UI:** [frontend/ChatComponent.jsx](frontend/ChatComponent.jsx) (React component)
3. **Example:** See usage in ChatComponent.jsx

### For Judges & Presentations
1. **Script:** [JUDGES_GUIDE.md](JUDGES_GUIDE.md) (Demo tips & talking points)
2. **Summary:** [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) (What's been built)

---

## 🔑 Key Files at a Glance

| What You Need | Where to Find |
|---------------|---------------|
| Project overview | README.md |
| Setup instructions | DEPLOYMENT_GUIDE.md |
| Database schema | backend/database/schema.sql |
| LLM prompts | backend/prompts/systemPrompts.js |
| Role-based access | backend/functions/roleBasedLogic.js |
| Emergency handling | backend/functions/emergencyDetection.js |
| Main API logic | backend/functions/healthcareAIFunction.js |
| API endpoints | backend/api/endpoints.js |
| Frontend client | frontend/client.js |
| React component | frontend/ChatComponent.jsx |
| Config file | config/antigravity.config.json |
| Judge tips | JUDGES_GUIDE.md |
| Implementation summary | IMPLEMENTATION_SUMMARY.md |
| Quick reference | QUICKSTART.sh |

---

## 📊 File Dependency Map

```
User Request
    ↓
frontend/client.js (HealthcareAIClient)
    ↓
backend/api/endpoints.js (API Definition)
    ↓
backend/api/handlers.js (Request Handler)
    ↓
backend/functions/healthcareAIFunction.js (Orchestrator)
    ├─→ backend/functions/roleBasedLogic.js (Authorization)
    ├─→ backend/prompts/promptManager.js (Build Prompt)
    │       ├─→ backend/prompts/systemPrompts.js (Prompts)
    │       └─→ backend/functions/emergencyDetection.js (Emergency check)
    ├─→ backend/functions/llmIntegration.js (LLM Client)
    │       └─→ config/antigravity.config.json (Config)
    └─→ backend/database/schema.sql (Data Storage)
        ↓
    AI Response
        ↓
    frontend/ChatComponent.jsx (Display)
```

---

## 🚀 Quick Navigation by Task

### "I want to deploy this"
→ Start with [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

### "I want to understand the architecture"
→ Read [README.md](README.md), then examine:
  - [backend/functions/healthcareAIFunction.js](backend/functions/healthcareAIFunction.js)
  - [backend/functions/roleBasedLogic.js](backend/functions/roleBasedLogic.js)
  - [backend/prompts/systemPrompts.js](backend/prompts/systemPrompts.js)

### "I want to add this to my app"
→ Use [frontend/client.js](frontend/client.js) and [frontend/ChatComponent.jsx](frontend/ChatComponent.jsx)

### "I need to present this to judges"
→ Read [JUDGES_GUIDE.md](JUDGES_GUIDE.md)

### "I want to modify the prompts"
→ Edit [backend/prompts/systemPrompts.js](backend/prompts/systemPrompts.js)

### "I need to add a new role"
→ Modify:
  1. [backend/functions/roleBasedLogic.js](backend/functions/roleBasedLogic.js) (Add to ROLES)
  2. [backend/prompts/systemPrompts.js](backend/prompts/systemPrompts.js) (Add prompt)
  3. Test with new role

### "How do I add emergency keywords?"
→ Edit [backend/functions/emergencyDetection.js](backend/functions/emergencyDetection.js)
→ Update EMERGENCY_KEYWORDS object

### "I need to change the database schema"
→ Modify [backend/database/schema.sql](backend/database/schema.sql)
→ Then redeploy in Antigravity

---

## 📋 Implementation Checklist

- [ ] Read README.md (5 min)
- [ ] Review DEPLOYMENT_GUIDE.md (10 min)
- [ ] Examine database schema (5 min)
- [ ] Review prompts (10 min)
- [ ] Study main function (15 min)
- [ ] Get Antigravity account
- [ ] Get LLM API key
- [ ] Run through DEPLOYMENT_GUIDE.md (65 min)
- [ ] Test with sample data
- [ ] Review JUDGES_GUIDE.md for demo tips
- [ ] Practice presentation

**Total time: ~3-4 hours for complete deployment**

---

## 📞 Support & Resources

### Antigravity
- Documentation: https://docs.antigravity.io
- Dashboard: https://app.antigravity.io

### LLM Providers
- Google Gemini: https://ai.google.dev
- OpenAI: https://openai.com/api

### Healthcare Compliance
- HIPAA Rules: https://www.hhs.gov/hipaa

---

## ✅ Complete Feature List

All 9 steps from requirements implemented:

✅ Step 1: Antigravity project setup  
✅ Step 2: User roles table  
✅ Step 3: Health data tables  
✅ Step 4: LLM integration  
✅ Step 5: Master system prompt  
✅ Step 6: Role-based prompt logic  
✅ Step 7: LLM data + prompt handling  
✅ Step 8: Emergency detection  
✅ Step 9: Frontend connection  

Plus extras:
✅ Role-based access control  
✅ Audit logging  
✅ Error handling  
✅ Multiple LLM support  
✅ Complete documentation  
✅ Judge presentation guide  

---

## 🎉 You're Ready!

All files are in place. Time to deploy! 

**Next step:** Read [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) and follow the 7 phases.

Good luck! 🚀
