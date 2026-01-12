/**
 * LLM Integration Module
 * Handles communication with OpenAI, Claude, or other LLM APIs
 * 
 * To use with production LLMs:
 * 1. Install client: npm install openai (or @anthropic-ai/sdk)
 * 2. Add API key to .env: OPENAI_API_KEY=sk-...
 * 3. Uncomment the provider of your choice below
 * 4. Replace generateMockResponse() in server.js with real API call
 */

// ============================================
// OPENAI INTEGRATION (Recommended)
// ============================================

// import OpenAI from 'openai';
//
// const openai = new OpenAI({
//   apiKey: process.env.OPENAI_API_KEY,
// });
//
// export async function chatWithOpenAI(messages, systemPrompt) {
//   try {
//     const response = await openai.chat.completions.create({
//       model: 'gpt-4-turbo-preview', // or 'gpt-3.5-turbo'
//       messages: [
//         { role: 'system', content: systemPrompt },
//         ...messages
//       ],
//       temperature: 0.7,
//       max_tokens: 1000,
//       top_p: 0.9,
//     });
//
//     return response.choices[0].message.content;
//   } catch (error) {
//     console.error('OpenAI API error:', error.message);
//     throw new Error('Failed to generate response');
//   }
// }

// ============================================
// ANTHROPIC CLAUDE INTEGRATION
// ============================================

// import Anthropic from '@anthropic-ai/sdk';
//
// const anthropic = new Anthropic({
//   apiKey: process.env.ANTHROPIC_API_KEY,
// });
//
// export async function chatWithClaude(messages, systemPrompt) {
//   try {
//     // Convert messages format for Claude
//     const claudeMessages = messages.map(msg => ({
//       role: msg.role,
//       content: msg.content
//     }));
//
//     const response = await anthropic.messages.create({
//       model: 'claude-3-opus-20240229',
//       max_tokens: 1000,
//       system: systemPrompt,
//       messages: claudeMessages,
//     });
//
//     return response.content[0].type === 'text' ? response.content[0].text : '';
//   } catch (error) {
//     console.error('Claude API error:', error.message);
//     throw new Error('Failed to generate response');
//   }
// }

// ============================================
// OLLAMA (Local LLM - Free)
// ============================================

// import axios from 'axios';
//
// export async function chatWithOllama(messages, systemPrompt) {
//   try {
//     // Requires Ollama running on localhost:11434
//     const response = await axios.post(
//       'http://localhost:11434/api/chat',
//       {
//         model: 'mistral', // or 'neural-chat', 'llama2', etc.
//         messages: [
//           { role: 'system', content: systemPrompt },
//           ...messages
//         ],
//         stream: false,
//       },
//       { timeout: 30000 }
//     );
//
//     return response.data.message.content;
//   } catch (error) {
//     console.error('Ollama API error:', error.message);
//     throw new Error('Failed to generate response. Ensure Ollama is running.');
//   }
// }

// ============================================
// USAGE IN server.js
// ============================================

// Replace the mock generateMockResponse() with:
//
// async function generateResponse(messages, systemPrompt) {
//   try {
//     // Pick one:
//     // const response = await chatWithOpenAI(messages, systemPrompt);
//     // const response = await chatWithClaude(messages, systemPrompt);
//     // const response = await chatWithOllama(messages, systemPrompt);
//
//     return response;
//   } catch (error) {
//     console.error('Chat error:', error);
//     return 'I apologize, but I encountered an error processing your message. Please try again.';
//   }
// }

// ============================================
// ENVIRONMENT SETUP
// ============================================

/*
Add to .env file:

# OpenAI
OPENAI_API_KEY=sk-...

# Anthropic Claude
ANTHROPIC_API_KEY=sk-ant-...

# Ollama (optional, for local LLM)
OLLAMA_URL=http://localhost:11434

# Model selection (optional)
LLM_PROVIDER=openai  # or 'claude', 'ollama'
LLM_MODEL=gpt-4-turbo-preview
*/

// ============================================
// SETUP INSTRUCTIONS
// ============================================

/*

1. OPENAI (Recommended for production):
   - Install: npm install openai
   - Get key: https://platform.openai.com/api-keys
   - Add to .env: OPENAI_API_KEY=sk-...
   - Cost: ~$0.01-0.10 per request (varies by model)

2. ANTHROPIC CLAUDE:
   - Install: npm install @anthropic-ai/sdk
   - Get key: https://console.anthropic.com/
   - Add to .env: ANTHROPIC_API_KEY=sk-ant-...
   - Cost: ~$0.003-0.024 per request (varies by model)

3. OLLAMA (Free, runs locally):
   - Install: https://ollama.ai/
   - Download model: ollama pull mistral
   - Run: ollama serve
   - Cost: Free (runs on your hardware)

4. TOGETHER AI (Budget-friendly):
   - Install: npm install together-ai
   - Get key: https://www.together.ai/
   - Lower costs than OpenAI

5. HuggingFace (Free tier available):
   - Install: npm install @huggingface/inference
   - Get key: https://huggingface.co/settings/tokens
   - Free tier with usage limits

*/

export default {};
