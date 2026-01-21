/**
 * Deployment & Setup Guide
 * Complete instructions for setting up Healthcare Platform in Antigravity
 */

# Healthcare Platform in Antigravity - Deployment Guide

## Phase 1: Antigravity Project Setup (5 mins)

### 1.1 Create New Project
```
Dashboard → New Project
Name: Smart Healthcare AI Platform
Region: [Your region]
Tier: Standard/Pro (depends on scale)
```

### 1.2 Enable Features
Check these options during project creation:
- ✅ Authentication (Email/OAuth)
- ✅ Database (PostgreSQL)
- ✅ APIs / Functions
- ✅ Real-time capabilities
- ✅ File storage (optional)

### 1.3 Database Setup
In Antigravity Dashboard:
```
1. Go to Database → SQL
2. Create new SQL database
3. Copy contents of: backend/database/schema.sql
4. Execute the SQL
5. Verify tables created:
   - Users
   - PatientHealthData
   - Alerts
   - ConversationLog
   - Appointments
```

## Phase 2: LLM Configuration (10 mins)

### 2.1 Configure LLM Provider

**For Gemini (Recommended):**
```
Dashboard → Integrations → AI
1. Select: Google Generative AI (Gemini)
2. Add API Key: [Get from Google AI Studio]
3. Model: gemini-pro
4. Save
```

**For OpenAI:**
```
Dashboard → Integrations → AI
1. Select: OpenAI
2. Add API Key: sk-[your-key]
3. Model: gpt-3.5-turbo or gpt-4
4. Save
```

### 2.2 Store Configuration
In Antigravity config (or environment variables):
```json
{
  "llm": {
    "provider": "gemini",
    "api_key": "${GEMINI_API_KEY}",
    "model": "gemini-pro",
    "temperature": 0.7,
    "max_tokens": 500
  }
}
```

## Phase 3: Deploy Backend Functions (15 mins)

### 3.1 Upload Functions to Antigravity

**In Antigravity Functions:**

1. **System Prompts Function**
   - File: `backend/prompts/systemPrompts.js`
   - Type: Reusable Module
   - Deploy as: `systemPrompts`

2. **Prompt Manager Function**
   - File: `backend/prompts/promptManager.js`
   - Type: Reusable Module
   - Deploy as: `promptManager`

3. **LLM Integration Function**
   - File: `backend/functions/llmIntegration.js`
   - Type: Reusable Module
   - Deploy as: `llmService`

4. **Role-Based Logic Function**
   - File: `backend/functions/roleBasedLogic.js`
   - Type: Reusable Module
   - Deploy as: `roleLogic`

5. **Emergency Detection Function**
   - File: `backend/functions/emergencyDetection.js`
   - Type: Reusable Module
   - Deploy as: `emergencyService`

6. **Main Healthcare AI Function** (PRIMARY)
   - File: `backend/functions/healthcareAIFunction.js`
   - Type: Main Function
   - Trigger: HTTP
   - Deploy as: `healthcareAI`
   - Set as Public API endpoint

### 3.2 Link Functions
In each function, add imports for dependencies:
```javascript
import promptManager from './promptManager.js';
import llmService from './llmIntegration.js';
import roleLogic from './roleBasedLogic.js';
import emergencyService from './emergencyDetection.js';
```

## Phase 4: Create API Endpoints (15 mins)

### 4.1 Create REST API Routes

In Antigravity APIs section:

```
POST /api/v1/chat
├─ Handler: healthcareAI.processHealthcareQuery
├─ Auth: Required (JWT)
└─ Rate Limit: 100/min per user

GET /api/v1/patients/:patientId/health-data
├─ Handler: API Handlers
├─ Auth: Required
└─ Rate Limit: 50/min per user

POST /api/v1/alerts
├─ Handler: API Handlers
├─ Auth: Required (Doctor/Admin)
└─ Rate Limit: 20/min per user

GET /api/v1/users/:userId/role
├─ Handler: API Handlers
├─ Auth: Required
└─ Rate Limit: 100/min per user

POST /api/v1/conversation/start
├─ Handler: API Handlers
├─ Auth: Required
└─ Rate Limit: 50/min per user

GET /api/v1/conversation/:conversationId/history
├─ Handler: API Handlers
├─ Auth: Required
└─ Rate Limit: 50/min per user
```

### 4.2 Enable CORS
```
Settings → API Security → CORS
Add allowed origins:
- http://localhost:3000 (development)
- https://yourdomain.com (production)
```

## Phase 5: Frontend Integration (10 mins)

### 5.1 Install Frontend Client
```bash
npm install
# or just copy frontend/client.js to your project
```

### 5.2 Initialize in Your App

**React:**
```jsx
import HealthcareAIClient from './client.js';
import HealthcareChatComponent from './ChatComponent.jsx';

function App() {
  const [token, setToken] = useState(null);
  
  return (
    <HealthcareChatComponent
      userId="user_123"
      userRole="patient"
      token={token}
      patientId="patient_456"
    />
  );
}
```

**Vanilla JavaScript:**
```javascript
const client = new HealthcareAIClient({
  baseURL: 'https://your-antigravity-project.com/api/v1',
  userId: 'user_123',
  userRole: 'patient',
  token: authToken
});

// Start conversation
await client.startConversation();

// Send message
const response = await client.sendMessage('How do I manage my diabetes?');
console.log(response.response);
```

## Phase 6: Testing (10 mins)

### 6.1 Test Each Role

**Patient Test:**
```json
{
  "userId": "patient_001",
  "userRole": "patient",
  "message": "What should I do about my high blood pressure?"
}
```

Expected: Patient-appropriate response, no medical diagnosis.

**Doctor Test:**
```json
{
  "userId": "doctor_001",
  "userRole": "doctor",
  "patientId": "patient_001",
  "message": "Review patient's recent vitals"
}
```

Expected: Clinical context without diagnosis.

**Emergency Test:**
```json
{
  "userId": "patient_002",
  "userRole": "patient",
  "message": "I have severe chest pain and cannot breathe!"
}
```

Expected: Emergency protocol triggered, emergency response returned.

### 6.2 Verify Database
```sql
SELECT * FROM Users;
SELECT * FROM Alerts WHERE severity = 'high';
SELECT * FROM ConversationLog LIMIT 10;
```

## Phase 7: Monitoring & Maintenance

### 7.1 Set Up Monitoring
```
Dashboard → Monitoring
- Monitor LLM API costs
- Track error rates
- Monitor response times
- Alert on emergency detection
```

### 7.2 Logging & Audit Trail
All data access is logged in:
- `ConversationLog` - All interactions
- `Alerts` - Emergency and critical events
- `AuditLog` - Admin actions and data access

### 7.3 Regular Maintenance
- Review emergency alerts weekly
- Monitor API costs monthly
- Rotate API keys quarterly
- Update prompts based on feedback

## Production Checklist

- [ ] Database backed up daily
- [ ] LLM API key secured (environment variables)
- [ ] CORS properly configured
- [ ] Rate limiting enabled
- [ ] Logging and monitoring active
- [ ] SSL/TLS enabled
- [ ] HIPAA compliance verified
- [ ] User authentication tested
- [ ] Role-based access tested
- [ ] Emergency detection tested

## Troubleshooting

**LLM connection failing:**
- Check API key in environment variables
- Verify provider is correctly set
- Check API rate limits
- Ensure model name is correct

**Authorization errors:**
- Verify JWT token is valid
- Check user role in database
- Verify patient assignment (for doctors/caretakers)

**Emergency not triggering:**
- Check keywords in `emergencyDetection.js`
- Verify emergency detection is called
- Check alert table for created alerts

**Slow responses:**
- Monitor LLM API response times
- Check database query performance
- Review conversation history size

## Support & Documentation

- Antigravity Docs: https://docs.antigravity.io
- API Reference: See `backend/api/endpoints.js`
- Function Guide: See each file in `backend/functions/`
- Frontend Guide: See `frontend/client.js`

---

**Total Setup Time: ~65 minutes**

Happy building! 🚀
