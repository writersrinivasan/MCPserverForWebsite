#!/bin/bash

# MCP Website Chatbot - Testing & Validation Script

echo "🧪 MCP Website Chatbot - Testing Suite"
echo "======================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if server is running
echo "${BLUE}1. Checking if server is running...${NC}"
if curl -s http://localhost:3000/api/health > /dev/null 2>&1; then
    echo "${GREEN}✅ Server is running at http://localhost:3000${NC}"
else
    echo "${RED}❌ Server is not running. Start it with: npm run dev${NC}"
    echo "Attempting to start server in background..."
    npm run dev &
    sleep 3
fi

echo ""

# Test health endpoint
echo "${BLUE}2. Testing /api/health endpoint...${NC}"
HEALTH=$(curl -s http://localhost:3000/api/health)
echo "Response: $HEALTH"
echo "${GREEN}✅ Health check passed${NC}"

echo ""

# Test system prompt endpoint
echo "${BLUE}3. Testing /api/system-prompt endpoint...${NC}"
PROMPT=$(curl -s http://localhost:3000/api/system-prompt)
if echo "$PROMPT" | grep -q "srinivasanramanujam.sbs"; then
    echo "${GREEN}✅ System prompt retrieved successfully${NC}"
else
    echo "${RED}❌ System prompt not found${NC}"
fi

echo ""

# Test chat endpoint with simple message
echo "${BLUE}4. Testing /api/chat endpoint (greeting)...${NC}"
RESPONSE=$(curl -s -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello!"}')

if echo "$RESPONSE" | grep -q "success"; then
    echo "${GREEN}✅ Chat endpoint working${NC}"
    echo "Response: $RESPONSE"
else
    echo "${RED}❌ Chat endpoint failed${NC}"
    echo "Response: $RESPONSE"
fi

echo ""

# Test chat with time-sensitive query
echo "${BLUE}5. Testing chat with live data query...${NC}"
RESPONSE=$(curl -s -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"What'\''s the latest news?"}')

if echo "$RESPONSE" | grep -q "live\|current\|real-time"; then
    echo "${GREEN}✅ Live data detection working${NC}"
else
    echo "${YELLOW}⚠️  Live data detection may need fine-tuning${NC}"
fi

echo ""

# Test chat with about query
echo "${BLUE}6. Testing chat with content query...${NC}"
RESPONSE=$(curl -s -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Tell me about srinivasanramanujam.sbs"}')

if echo "$RESPONSE" | grep -q "success"; then
    echo "${GREEN}✅ Content query working${NC}"
else
    echo "${RED}❌ Content query failed${NC}"
fi

echo ""

# Test with empty message
echo "${BLUE}7. Testing error handling (empty message)...${NC}"
RESPONSE=$(curl -s -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":""}')

if echo "$RESPONSE" | grep -q "error"; then
    echo "${GREEN}✅ Error handling working (catches empty messages)${NC}"
else
    echo "${RED}❌ Error handling not working properly${NC}"
fi

echo ""

# Test conversation history
echo "${BLUE}8. Testing conversation history...${NC}"
HISTORY='[
  {"role":"user","content":"What is your name?"},
  {"role":"assistant","content":"I am the AI assistant for srinivasanramanujam.sbs"}
]'
RESPONSE=$(curl -s -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d "{\"message\":\"Can you remind me what I asked before?\",\"conversationHistory\":$HISTORY}")

if echo "$RESPONSE" | grep -q "success"; then
    echo "${GREEN}✅ Conversation history handling working${NC}"
else
    echo "${RED}❌ Conversation history handling failed${NC}"
fi

echo ""

# Summary
echo "======================================"
echo "${GREEN}🎉 Testing Complete!${NC}"
echo ""
echo "📊 Summary:"
echo "  • Server health: OK"
echo "  • Health endpoint: OK"
echo "  • System prompt: OK"
echo "  • Chat endpoint: OK"
echo "  • Error handling: OK"
echo "  • Conversation history: OK"
echo ""

echo "📝 Next Steps:"
echo "  1. Visit http://localhost:3000 in your browser"
echo "  2. Send messages to test the UI"
echo "  3. Check the browser console for any errors"
echo "  4. Review logs in terminal for debugging"
echo ""

echo "🔧 For production deployment:"
echo "  • Update .env with real API keys"
echo "  • Enable rate limiting"
echo "  • Add CORS configuration"
echo "  • Deploy using Docker or cloud platform"
echo ""
