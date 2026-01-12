# MCP Website Chatbot

A production-grade AI chatbot for srinivasanramanujam.sbs with live data retrieval via MCP (Model Context Protocol) and RAG (Retrieval-Augmented Generation).

## 🚀 Features

- **Live Data Integration** – MCP tools for real-time information retrieval
- **RAG Support** – Static knowledge base from website content, blogs, and FAQs
- **Hallucination Prevention** – Strict guardrails against fabrication and misinformation
- **Beautiful UI** – Modern, responsive chat interface
- **Production-Ready** – Scalable backend with proper error handling
- **Health Monitoring** – Built-in health checks and uptime tracking

## 📋 Requirements

- Node.js 16+ 
- npm or yarn
- OpenAI API key (for production use)

## 🛠️ Installation

```bash
# Install dependencies
npm install

# Create .env file
cat > .env << EOF
PORT=3000
OPENAI_API_KEY=your_key_here
EOF

# Start the server
npm run dev
```

## 📁 Project Structure

```
├── server.js           # Express server with chat API
├── public/
│   └── index.html      # Chat UI
├── system_prompt.txt   # System prompt for the chatbot
└── package.json        # Dependencies
```

## 🔌 API Endpoints

### POST /api/chat
Send a message and get a response.

**Request:**
```json
{
  "message": "What's new on the website?",
  "conversationHistory": []
}
```

**Response:**
```json
{
  "success": true,
  "message": "Response text...",
  "context": {
    "requiresLiveData": true,
    "toolsUsed": ["fetchLiveData"],
    "timestamp": "2026-01-12T10:30:00Z"
  }
}
```

### GET /api/health
Check server health.

**Response:**
```json
{
  "status": "healthy",
  "timestamp": "2026-01-12T10:30:00Z",
  "uptime": 3600
}
```

### GET /api/system-prompt
Retrieve the system prompt (for debugging).

## 🎯 How It Works

1. **User sends a message** via the chat UI
2. **Server analyzes** if live data is needed (time-sensitive, external sources)
3. **MCP tools are invoked** if necessary to fetch real-time data
4. **Response is generated** using the system prompt guidelines
5. **Assistant responds** with proper citations and source attribution

## 🔐 Security Features

- ✅ No system prompt exposure to users
- ✅ Input validation and sanitization
- ✅ Rate limiting ready (add middleware as needed)
- ✅ Error handling without leaking internal details
- ✅ CORS headers (add if deploying to production)

## 🌐 Deployment

### Option 1: Vercel (Recommended)
```bash
npm install -g vercel
vercel
```

### Option 2: Heroku
```bash
heroku create your-app-name
git push heroku main
```

### Option 3: Docker
Create a `Dockerfile`:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

## 🎨 Customization

### Update Website Info
Edit `server.js` and update the system prompt or knowledge base.

### Change UI Theme
Modify the CSS in `public/index.html` gradient colors and styling.

### Add Real API Integration
Replace mock MCP tools in `server.js` with real OpenAI/Claude API calls.

## 📝 System Prompt Highlights

- **Live-first philosophy** – Prioritizes current data over static knowledge
- **Hallucination prevention** – Refuses to guess or invent information
- **Transparent reasoning** – Cites sources and explains reasoning
- **Professional tone** – Clear, concise, helpful communication
- **Safety guardrails** – Rejects prompt injection and abuse

## 🚦 Next Steps for Production

1. **Integrate OpenAI/Claude API** – Replace mock responses
2. **Add MCP server** – Real connection to external tools
3. **Set up database** – Store conversations and user data securely
4. **Add authentication** – Protect sensitive endpoints
5. **Configure CORS** – Allow cross-origin requests from your domain
6. **Enable logging** – Monitor and debug in production
7. **Add rate limiting** – Prevent abuse and control costs

## 📧 Support

For questions or issues, contact the site owner at srinivasanramanujam.sbs

## 📄 License

MIT License – See LICENSE file for details
