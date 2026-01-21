#!/bin/bash
# Quick Start Guide for Healthcare Platform

# ============================================
# Healthcare Platform - Quick Start
# ============================================

echo "🏥 Healthcare Platform Quick Start Guide"
echo "=========================================="
echo ""

# Step 1: Check Prerequisites
echo "✓ Step 1: Verifying Prerequisites..."
echo ""
echo "Required:"
echo "  - Node.js 16+ (for testing)"
echo "  - Antigravity Account"
echo "  - LLM API Key (Gemini or OpenAI)"
echo ""

# Step 2: Project Structure
echo "✓ Step 2: Project Structure Created"
echo ""
tree -L 3 2>/dev/null || find . -maxdepth 3 -type d | sort | sed 's|[^/]*/| |g'
echo ""

# Step 3: Database
echo "✓ Step 3: Database Schema"
echo ""
echo "To set up database:"
echo "  1. Copy backend/database/schema.sql"
echo "  2. Run in Antigravity Database section"
echo "  3. Verify 6 tables created"
echo ""

# Step 4: Configuration
echo "✓ Step 4: Configuration Files"
echo ""
echo "Edit config/antigravity.config.json:"
echo "  - Set LLM provider (gemini or openai)"
echo "  - Add API key to environment variables"
echo "  - Configure temperature, max_tokens"
echo ""

# Step 5: Deploy Functions
echo "✓ Step 5: Deploy Backend Functions"
echo ""
echo "Upload to Antigravity:"
echo "  1. systemPrompts.js (Module)"
echo "  2. promptManager.js (Module)"
echo "  3. llmIntegration.js (Module)"
echo "  4. roleBasedLogic.js (Module)"
echo "  5. emergencyDetection.js (Module)"
echo "  6. healthcareAIFunction.js (Main Function)"
echo ""

# Step 6: Create API Endpoints
echo "✓ Step 6: Create API Endpoints"
echo ""
echo "In Antigravity APIs:"
echo "  - POST /api/v1/chat"
echo "  - GET /api/v1/patients/:patientId/health-data"
echo "  - POST /api/v1/alerts"
echo "  - GET /api/v1/users/:userId/role"
echo "  - POST /api/v1/conversation/start"
echo "  - GET /api/v1/conversation/:id/history"
echo ""

# Step 7: Frontend
echo "✓ Step 7: Integrate Frontend"
echo ""
echo "Install client library:"
echo "  import HealthcareAIClient from './frontend/client.js'"
echo ""
echo "Use React component:"
echo "  import HealthcareChatComponent from './frontend/ChatComponent.jsx'"
echo ""

# Step 8: Test
echo "✓ Step 8: Test the Platform"
echo ""
echo "Test curl command:"
echo ""
echo "curl -X POST http://localhost:3000/api/v1/chat \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -H 'Authorization: Bearer YOUR_TOKEN' \\"
echo "  -d '{"
echo "    \"userId\": \"user_001\","
echo "    \"userRole\": \"patient\","
echo "    \"message\": \"How do I manage my blood pressure?\""
echo "  }'"
echo ""

# Step 9: Deploy
echo "✓ Step 9: Deploy to Production"
echo ""
echo "Antigravity Deployment:"
echo "  1. Go to Settings → Deployment"
echo "  2. Enable Production Mode"
echo "  3. Configure CORS for your domain"
echo "  4. Set up SSL/TLS"
echo "  5. Enable monitoring"
echo ""

# Summary
echo "=========================================="
echo "📋 Summary"
echo "=========================================="
echo ""
echo "Files Created:"
echo "  ✓ backend/database/schema.sql"
echo "  ✓ backend/prompts/systemPrompts.js"
echo "  ✓ backend/prompts/promptManager.js"
echo "  ✓ backend/functions/llmIntegration.js"
echo "  ✓ backend/functions/roleBasedLogic.js"
echo "  ✓ backend/functions/emergencyDetection.js"
echo "  ✓ backend/functions/healthcareAIFunction.js"
echo "  ✓ backend/api/endpoints.js"
echo "  ✓ backend/api/handlers.js"
echo "  ✓ frontend/client.js"
echo "  ✓ frontend/ChatComponent.jsx"
echo "  ✓ config/antigravity.config.json"
echo ""

echo "Next Steps:"
echo "  1. Read DEPLOYMENT_GUIDE.md"
echo "  2. Read JUDGES_GUIDE.md for demo tips"
echo "  3. Get LLM API key ready"
echo "  4. Set up Antigravity project"
echo "  5. Deploy functions and endpoints"
echo "  6. Test with sample data"
echo "  7. Go live!"
echo ""

echo "Documentation:"
echo "  📖 README.md - Project overview"
echo "  📖 DEPLOYMENT_GUIDE.md - Step-by-step setup"
echo "  📖 JUDGES_GUIDE.md - Demo & presentation tips"
echo ""

echo "Key Features:"
echo "  ✓ Role-based LLM control"
echo "  ✓ Emergency detection system"
echo "  ✓ HIPAA-ready architecture"
echo "  ✓ Audit logging"
echo "  ✓ Data access control"
echo "  ✓ Multi-LLM support"
echo ""

echo "🚀 You're ready to go!"
echo "=========================================="
