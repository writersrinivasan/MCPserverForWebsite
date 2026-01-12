# 🤖 MCP Website Chatbot - Quick Start Guide

Welcome! Your production-grade website chatbot application is ready. Here's how to get started:

## 📋 What's Included

Your app has been built with these files:

```
├── server.js              ← Express backend with chat API
├── public/index.html      ← Beautiful chat UI
├── mcp-client.js          ← MCP tool integration module
├── system_prompt.txt      ← AI system prompt
├── package.json           ← Dependencies
├── .env.example           ← Environment template
├── README.md              ← Full documentation
├── Dockerfile             ← Docker containerization
├── docker-compose.yml     ← Docker Compose setup
└── setup.sh               ← Auto-setup script
```

## 🚀 Quick Start (3 Steps)

### Step 1: Install Dependencies
```bash
cd /Users/srinivasanramanujam/Documents/AgenticAI/MCPserverForwebsite
npm install
```

### Step 2: Start the Server
```bash
npm run dev
```

You should see:
```
🤖 MCP Chatbot Server running on http://localhost:3000
📱 Frontend: http://localhost:3000
💬 Chat API: POST http://localhost:3000/api/chat
```

### Step 3: Open in Browser
Visit: **http://localhost:3000**

## 💬 Try It Out

Test the chatbot with these queries:
- "Hello!" – Gets a welcome message
- "What is srinivasanramanujam.sbs?" – Learns about the site
- "What's the latest news?" – Triggers live data fetching (with MCP)
- "Can you check the current status?" – Demonstrates real-time verification

## 🔧 Configuration

### Update API Keys (Production)
Edit `.env`:
```bash
cp .env.example .env
# Add your OpenAI/Claude API key
OPENAI_API_KEY=sk-...
```

### Customize System Prompt
Edit `system_prompt.txt` to change chatbot behavior, voice, or knowledge.

### Update Website Info
In `server.js`, modify:
```javascript
WEBSITE_NAME: 'srinivasanramanujam.sbs'
WEBSITE_URL: 'https://srinivasanramanujam.sbs'
```

## 🌐 Deployment Options

### **Vercel (Easiest – Recommended)**
```bash
npm install -g vercel
vercel
```
Follow the prompts to deploy instantly.

### **Docker (Any Cloud)**
```bash
# Build image
docker build -t mcp-chatbot .

# Run container
docker run -p 3000:3000 mcp-chatbot

# Or use Docker Compose
docker-compose up
```

### **Heroku**
```bash
heroku create your-app-name
git push heroku main
```

## 🔗 API Endpoints

### Send a Chat Message
```bash
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello!"}'
```

### Check Server Health
```bash
curl http://localhost:3000/api/health
```

### Get System Prompt
```bash
curl http://localhost:3000/api/system-prompt
```

## 📊 Key Features

✅ **Live Data Integration** – MCP tools for real-time retrieval
✅ **Hallucination Prevention** – Strict guardrails against misinformation
✅ **Beautiful UI** – Modern, responsive chat interface
✅ **Production-Ready** – Error handling, health checks, logging
✅ **Easy to Customize** – Change prompts, add APIs, modify UI
✅ **Containerized** – Dockerfile for easy deployment

## 🔐 Security Highlights

- ✅ System prompt not exposed to users
- ✅ Input validation and sanitization
- ✅ No secrets in version control (.gitignore setup)
- ✅ Rate limiting ready (add middleware as needed)
- ✅ Error messages don't leak internal details

## 🎯 Next Steps

1. **Test locally** – Run `npm run dev` and chat
2. **Integrate real API** – Add OpenAI/Claude API key to `.env`
3. **Connect MCP server** – Point to your actual MCP server in `server.js`
4. **Customize appearance** – Edit CSS in `public/index.html`
5. **Deploy** – Use Vercel, Docker, or your preferred host
6. **Monitor** – Check health endpoint and error logs regularly

## 📚 Documentation

- **Full README**: See `README.md` for detailed setup & API docs
- **System Prompt**: See `system_prompt.txt` for chatbot behavior rules
- **MCP Client**: See `mcp-client.js` for tool integration details

## 🆘 Troubleshooting

**Port 3000 already in use?**
```bash
npm run dev -- --port 3001
```

**Dependencies not installing?**
```bash
rm -rf node_modules package-lock.json
npm install
```

**Module errors?**
```bash
npm install
npm run dev
```

## 💡 Pro Tips

1. **Add rate limiting** – Install `express-rate-limit` package
2. **Add CORS** – Use `cors` package for cross-origin requests
3. **Add logging** – Use `winston` for structured logging
4. **Add database** – Store conversations with MongoDB/PostgreSQL
5. **Add authentication** – Protect sensitive endpoints

## 📝 Support & Questions

- Check `README.md` for comprehensive documentation
- Review system prompt in `system_prompt.txt`
- Examine `server.js` for implementation details

---

**Happy chatting! 🚀**

Your chatbot is ready to serve srinivasanramanujam.sbs with intelligence and accuracy.
