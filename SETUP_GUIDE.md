# 🚀 AI Real Estate Assistant - Complete Setup Guide

## Prerequisites Installation

### 1. Install Python 3.12+

**Windows:**
1. Download Python 3.12 from: https://www.python.org/downloads/
2. ✅ **IMPORTANT:** Check "Add Python to PATH" during installation
3. Verify: Open PowerShell and run `python --version`

**Alternative (Recommended for Windows):**
```powershell
# Install via Windows Store (easier)
winget install Python.Python.3.12
```

### 2. Install UV (Fast Python Package Manager)

```powershell
# Install uv
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Verify installation
uv --version
```

---

## Quick Setup (Automated)

### Option A: Using the Run Script (Recommended)

```powershell
# Navigate to project
cd c:\Users\Wajiz.pk\Downloads\ai-real-estate-assistant-dev\ai-real-estate-assistant-dev

# Run local development setup
.\scripts\local\run.ps1
```

### Option B: Manual Setup

#### Step 1: Configure Environment Variables

Edit the `.env` file in the root directory with your API keys:

```env
# Required: At least one LLM provider
OPENAI_API_KEY=sk-your-openai-key-here
# OR
ANTHROPIC_API_KEY=sk-ant-your-anthropic-key-here
# OR use local models with Ollama (free)

# Required: API Security Key (generate a strong key)
API_ACCESS_KEY=your-secure-api-key-here

# Optional: For local models (free, no API key needed)
DEFAULT_PROVIDER=ollama
OLLAMA_API_BASE=http://localhost:11434
```

**Generate a secure API key:**
```powershell
# Generate random API key
openssl rand -hex 32
# OR use PowerShell
-join ((65..90) + (97..122) + (48..57) | Get-Random -Count 32 | ForEach-Object {[char]$_})
```

#### Step 2: Install Backend Dependencies

```powershell
# Navigate to project root
cd c:\Users\Wajiz.pk\Downloads\ai-real-estate-assistant-dev\ai-real-estate-assistant-dev

# Install uv if not already installed
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Create virtual environment and install dependencies
uv venv
.\.venv\Scripts\activate
uv pip install -e .[dev]
```

#### Step 3: Install Frontend Dependencies

```powershell
cd apps\web
npm install
cd ..
```

#### Step 4: Install Playwright Browsers (for testing)

```powershell
npx playwright install
```

---

## Running the Application

### Development Mode (Both Frontend + Backend)

```powershell
# From project root
npm run dev
```

This will start:
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8000
- **API Docs:** http://localhost:8000/docs

### Separate Servers

```powershell
# Terminal 1 - Backend
npm run dev:api

# Terminal 2 - Frontend
npm run dev:web
```

---

## Using Docker (Alternative)

If you prefer Docker:

```powershell
# CPU mode
.\scripts\docker\cpu.ps1

# GPU mode (if you have NVIDIA GPU)
.\scripts\docker\gpu.ps1
```

---

## Testing the Setup

### 1. Check Backend Health
Open browser: http://localhost:8000/health

### 2. Check Frontend
Open browser: http://localhost:3000

### 3. Test API Endpoints
Open: http://localhost:8000/docs (Swagger UI)

---

## Troubleshooting

### Python Not Found
```powershell
# Check Python installation
where python
python --version

# Reinstall if needed
winget install Python.Python.3.12
```

### Port Already in Use
```powershell
# Kill process on port 3000
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Kill process on port 8000
netstat -ano | findstr :8000
taskkill /PID <PID> /F
```

### Dependencies Installation Failed
```powershell
# Clear cache and reinstall
Remove-Item -Recurse -Force .venv -ErrorAction SilentlyContinue
uv venv
.\.venv\Scripts\activate
uv pip install -e .[dev]
```

### Frontend Build Issues
```powershell
cd apps\web
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
npm install
```

---

## Using Local LLM Models (Free - No API Key Required)

### 1. Install Ollama

```powershell
# Download and install from https://ollama.ai
# Or use winget
winget install Ollama.Ollama
```

### 2. Download a Model

```powershell
# Llama 3.2 (lightweight, fast)
ollama pull llama3.2

# Or Mistral (good balance)
ollama pull mistral
```

### 3. Configure .env

```env
DEFAULT_PROVIDER=ollama
OLLAMA_API_BASE=http://localhost:11434
```

### 4. Start Ollama

```powershell
ollama serve
```

---

## Project Structure

```
ai-real-estate-assistant/
├── apps/
│   ├── api/              # FastAPI backend
│   │   ├── agents/       # AI agents
│   │   ├── ai/           # LLM orchestration
│   │   ├── api/          # API endpoints
│   │   ├── tools/        # Property tools
│   │   └── vector_store/ # ChromaDB setup
│   └── web/              # Next.js frontend
│       ├── src/
│       │   ├── app/      # Pages
│       │   ├── components/
│       │   └── services/
│       └── public/
├── scripts/              # Automation scripts
├── deploy/               # Docker & deployment
└── docs/                 # Documentation
```

---

## Next Steps

1. ✅ Complete the setup above
2. 📚 Read `README.md` for architecture details
3. 🔧 Customize property data in `apps/api/data/`
4. 🎨 Customize frontend in `apps/web/src/`
5. 🚀 Deploy to Vercel when ready

---

## Need Help?

- **Documentation:** See `docs/` folder
- **API Reference:** http://localhost:8000/docs
- **Issues:** Check `README.md` troubleshooting section

---

**Good luck with your AI Real Estate Assistant! 🏠🤖**
