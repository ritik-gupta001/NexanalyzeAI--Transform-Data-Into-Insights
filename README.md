# Nexalyze AI - Transform Data Into Insights

[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.109.0-009688.svg)](https://fastapi.tiangolo.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> An autonomous multi-agent AI platform for intelligent research, data analysis, and automated insights generation.

## 🌟 Overview

Nexalyze AI is a cutting-edge research and automation platform that combines the power of Large Language Models (LLMs), Machine Learning, and advanced data processing to deliver:

📰 **Real-time News Analysis** - Scrape, analyze, and predict sentiment trends  
📄 **Document Intelligence** - Extract insights from PDFs, DOCX, and text files  
📊 **Data Analytics** - Discover patterns, anomalies, and forecasts from CSV/Excel data  
📝 **Automated Reporting** - Generate professional reports in Markdown, PDF, and DOCX formats  
📈 **Smart Visualizations** - Create interactive charts and graphs automatically

---

## 🔍 Key Features

### 🎨 Intelligent Analysis
- **Multi-Agent Architecture**: Orchestrated AI agents for complex task decomposition
- **LLM-Powered Insights**: Uses OpenAI GPT models via LangChain for deep analysis
- **ML Sentiment Analysis**: Custom scikit-learn models for accurate sentiment scoring
- **Trend Forecasting**: Statistical models for predicting future trends

### 📁 Multi-Format Support
- **Documents**: PDF, DOCX, TXT
- **Data Files**: CSV, Excel (XLSX, XLS)
- **Web Content**: Real-time news scraping and analysis

### 📊 Advanced Analytics
- Statistical analysis and distribution analysis
- Correlation detection
- Anomaly detection
- Time series forecasting
- Sentiment trend prediction

### 📋 Professional Outputs
- **Reports**: Markdown, PDF, DOCX formats
- **Visualizations**: Sentiment charts, trend graphs, correlation matrices, distribution plots
- **Task Tracking**: Complete task history with downloadable artifacts

---

## 🧠 Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    FastAPI Backend                      │
├─────────────────────────────────────────────────────────┤
│  REST API  │  WebSocket  │  Static Files  │  Templates  │
├─────────────────────────────────────────────────────────┤
│              Agent Orchestrator (LangChain)             │
├─────────────┬──────────────┬────────────────────────────┤
│ News Scraper │  Doc Parser  │  Data Analyzer  │  LLM   │
├─────────────┼──────────────┼─────────────────────────────┤
│         ML Models (Sentiment, Forecasting)              │
├─────────────────────────────────────────────────────────┤
│            SQLite Database (Task Storage)               │
└─────────────────────────────────────────────────────────┘
```

### Tech Stack
- **Backend**: FastAPI, Python 3.10+
- **AI/ML**: OpenAI GPT, LangChain, scikit-learn, PyTorch
- **Database**: SQLAlchemy ORM with SQLite
- **Frontend**: HTML5, CSS3, JavaScript

---

## 📦 Prerequisites

- Python 3.10 or higher
- OpenAI API Key ([Get one here](https://platform.openai.com/api-keys))
- pip package manager

---

## ⚙️ Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/ritik-gupta001/NexanalyzeAI--Transform-Data-Into-Insights.git
cd NexanalyzeAI--Transform-Data-Into-Insights
```

### 2. Create Virtual Environment
```bash
# Windows
python -m venv .venv
.venv\Scripts\activate

# macOS/Linux
python3 -m venv .venv
source .venv/bin/activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables
Create a `.env` file in the project root:
```env
# OpenAI Configuration
OPENAI_API_KEY=your_openai_api_key_here

# Application Settings
APP_NAME=Nexalyze AI
APP_VERSION=1.0.0
ENVIRONMENT=development

# Server Configuration
HOST=0.0.0.0
PORT=8000

# API Configuration
API_V1_PREFIX=/api/v1

# Database (SQLite)
DATABASE_URL=sqlite:///./pra_database.db
```

### 5. Run the Application
```bash
# Development mode with auto-reload
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

# Production mode
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

### 6. Access the Application
- **Web UI**: http://127.0.0.1:8000
- **API Docs**: http://127.0.0.1:8000/docs
- **OpenAPI**: http://127.0.0.1:8000/redoc

---

## 📚 API Documentation

### Endpoints

#### ✅ Health Check
```http
GET /api/v1/health
```

#### 📰 Analyze Text/News
```http
POST /api/v1/tasks/analyze-text
Content-Type: application/json

{
  "query": "Analyze recent news about Tesla and predict sentiment trend",
  "entity": "Tesla",
  "time_range": "last_7_days"
}
```

#### 📄 Analyze Document
```http
POST /api/v1/tasks/analyze-doc
Content-Type: multipart/form-data

file: <PDF/DOCX/TXT file>
instruction: "Summarize key findings and recommendations"
```

#### 📊 Analyze Data
```http
POST /api/v1/tasks/analyze-data
Content-Type: multipart/form-data

file: <CSV/Excel file>
instruction: "Find patterns and predict future trends"
```

#### 📦 Get Task Status
```http
GET /api/v1/tasks/{task_id}
```

#### 📋 List All Tasks
```http
GET /api/v1/tasks/?page=1&page_size=10
```

### Response Format
```json
{
  "task_id": "T-20241201-abc123",
  "status": "completed",
  "summary": "Analysis completed successfully...",
  "sentiment_summary": {
    "overall": "positive",
    "positive": 0.65,
    "neutral": 0.25,
    "negative": 0.10
  },
  "forecast": "Sentiment is predicted to remain positive over the next 7 days",
  "report_url": "/reports/T-20241201-abc123-report.md",
  "charts": [
    "/charts/T-20241201-abc123-sentiment.png",
    "/charts/T-20241201-abc123-trend.png"
  ],
  "created_at": "2024-12-01T10:00:00",
  "completed_at": "2024-12-01T10:05:30"
}
```

---

## 🌐 Render Deployment Guide

### 🚀 Deploy to Render (Recommended for ML Apps)

Render provides free hosting with Docker support, perfect for ML/AI applications with no size restrictions.

#### Why Render?
- ✅ **Free Tier**: 512MB RAM, no credit card required
- ✅ **Docker Support**: Full container support for ML libraries
- ✅ **Auto Deploy**: Push to GitHub triggers deployment
- ✅ **SSL/HTTPS**: Free SSL certificates
- ✅ **No Size Limits**: Unlike Vercel, supports large dependencies
- ✅ **Persistent Storage**: SQLite database persists

---

### Method 1: Deploy via Render Dashboard (Recommended)

#### Prerequisites
- GitHub account with repository pushed
- Render account ([Sign up free](https://dashboard.render.com/register))
- OpenAI API Key from [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

#### Step 1: Create Render Account
1. Go to [dashboard.render.com/register](https://dashboard.render.com/register)
2. Sign up with GitHub (easiest option)
3. Authorize Render to access your repositories

#### Step 2: Create New Web Service
1. Click **"New +"** button in top right
2. Select **"Web Service"**
3. Connect your repository: `NexanalyzeAI--Transform-Data-Into-Insights`
4. Click **"Connect"**

#### Step 3: Configure Service

**Basic Settings:**
- **Name**: `nexalyze-ai` (or your preferred name)
- **Region**: Oregon (US West) - or closest to you
- **Branch**: `main`
- **Runtime**: `Docker`

**Build & Deploy:**
- **Dockerfile Path**: `./Dockerfile` (auto-detected)
- Render will automatically use your Dockerfile

**Instance Type:**
- Select **"Free"** (512MB RAM, $0/month)

#### Step 4: Add Environment Variables

Click **"Advanced"** → **"Add Environment Variable"** for each:

| Key | Value |
|-----|-------|
| `OPENAI_API_KEY` | `your_openai_api_key_here` |
| `ENVIRONMENT` | `production` |
| `DATABASE_URL` | `sqlite:///./pra_database.db` |
| `APP_NAME` | `Nexalyze AI` |
| `HOST` | `0.0.0.0` |

💡 **Important**: Keep `OPENAI_API_KEY` as a secret!

#### Step 5: Configure Health Check (Optional but Recommended)
- **Health Check Path**: `/api/v1/health`

#### Step 6: Deploy
1. Click **"Create Web Service"**
2. Wait 5-8 minutes for initial build (Docker build takes longer)
3. Watch the build logs in real-time
4. Once complete, you'll see: ✅ **"Live"**

#### Step 7: Access Your Application
Your app will be available at:
- **URL**: `https://nexalyze-ai.onrender.com`
- **Health Check**: `https://nexalyze-ai.onrender.com/api/v1/health`
- **API Docs**: `https://nexalyze-ai.onrender.com/docs`
- **Interactive API**: `https://nexalyze-ai.onrender.com/redoc`

---

### Method 2: Deploy via render.yaml (Blueprint)

The repository includes `render.yaml` for one-click deployment:

1. Go to [dashboard.render.com](https://dashboard.render.com)
2. Click **"New +"** → **"Blueprint"**
3. Connect your repository
4. Render will auto-detect `render.yaml`
5. Add your `OPENAI_API_KEY` when prompted
6. Click **"Apply"**

---

### 🔄 Automatic Deployments

Once connected, Render automatically deploys:
- ✅ **Auto-Deploy**: Every push to `main` branch
- 🔄 **Manual Deploy**: Click "Manual Deploy" button anytime
- 📝 **Deploy Hooks**: Webhook URLs for CI/CD integration

---

### 📊 Post-Deployment Checklist

- [ ] Verify service is "Live" (green status)
- [ ] Test health endpoint: `/api/v1/health` (should return 200 OK)
- [ ] Check API documentation: `/docs`
- [ ] Test file upload functionality
- [ ] Verify AI analysis features work
- [ ] Check logs: Dashboard → Your Service → Logs
- [ ] (Optional) Add custom domain in Settings

---

### 🛠️ Project Structure for Render

```
project-root/
├── Dockerfile             # Docker configuration for Render
├── render.yaml            # Render blueprint (optional)
├── requirements.txt       # Python dependencies
├── app/
│   ├── main.py           # FastAPI application
│   ├── api/              # API routes
│   ├── core/             # Core configuration
│   ├── db/               # Database models
│   ├── genai/            # AI/LLM integration
│   ├── ml/               # ML models
│   └── services/         # Business logic
└── README.md
```

---

### 🐳 Dockerfile Configuration

```dockerfile
FROM python:3.10-slim
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y gcc g++
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .
RUN mkdir -p logs data uploads models app/charts app/reports

# Render sets PORT env variable
EXPOSE 8000
CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}
```

---

### 🔍 Troubleshooting

#### Build Fails
- Check build logs in Render Dashboard
- Verify Dockerfile syntax
- Ensure all dependencies in `requirements.txt`
- Check Python version compatibility (3.10+)

#### Service Won't Start
- Check service logs for errors
- Verify `OPENAI_API_KEY` is set correctly
- Ensure PORT environment variable is used
- Check health check path is correct

#### Slow Cold Starts (Free Tier)
- Free tier services spin down after 15 minutes of inactivity
- First request after idle takes ~30 seconds to wake up
- Upgrade to paid tier ($7/month) for always-on service

#### Database Issues
- SQLite works but data resets on redeployment
- For persistent data, consider PostgreSQL (Render provides free 90-day trial)
- Add persistent disk in Render settings

---

### 📈 Render Pricing & Features

| Feature | Free Tier | Starter ($7/mo) |
|---------|-----------|-----------------|
| RAM | 512 MB | 512 MB |
| CPU | Shared | Shared |
| Bandwidth | 100 GB/month | 100 GB/month |
| Build Minutes | 500/month | 500/month |
| Sleep After Inactivity | 15 minutes | Never |
| Custom Domain | ✅ Yes | ✅ Yes |
| SSL Certificate | ✅ Free | ✅ Free |
| Auto-Deploy | ✅ Yes | ✅ Yes |
| Docker Support | ✅ Yes | ✅ Yes |

---

### ⚡ Performance Tips

1. **Keep Service Awake** (Free Tier):
   - Use a cron job to ping your service every 14 minutes
   - Example: UptimeRobot (free monitoring service)

2. **Optimize Docker Build**:
   - Layer caching is used automatically
   - Heavy dependencies install first (requirements.txt)

3. **Monitor Performance**:
   - Check Metrics tab in Render Dashboard
   - Monitor response times and memory usage

4. **Upgrade When Needed**:
   - Upgrade to Starter ($7/mo) for always-on
   - No cold starts, better performance

---

### 🎯 Why Render for This Project?

- ✅ **ML Libraries**: Supports scikit-learn, matplotlib, seaborn
- ✅ **No Size Limits**: Unlike Vercel's 50MB limit
- ✅ **Docker Native**: Full control over environment
- ✅ **Free Tier**: No credit card required
- ✅ **Easy Setup**: Auto-detects Dockerfile
- ✅ **Great for AI**: Perfect for ML/AI applications

---

## 📁 Project Structure

```
nexalyze-ai/
├── app/
│   ├── main.py                    # FastAPI application entry point
│   ├── api/
│   │   ├── routes_health.py       # Health check endpoints
│   │   └── routes_tasks.py        # Task management endpoints
│   ├── core/
│   │   ├── config.py              # Configuration management
│   │   └── logger.py              # Logging setup
│   ├── db/
│   │   ├── base.py                # Database engine and session
│   │   ├── models.py              # SQLAlchemy models
│   │   └── init_db.py             # Database initialization
│   ├── genai/
│   │   ├── llm_client.py          # OpenAI/LangChain integration
│   │   └── prompts.py             # LLM prompt templates
│   ├── ml/
│   │   ├── sentiment_ml.py        # ML-based sentiment analysis
│   │   ├── sentiment_dl.py        # Deep learning sentiment (optional)
│   │   └── forecast_model.py      # Forecasting models
│   ├── services/
│   │   ├── agent_orchestrator.py  # Multi-agent task orchestration
│   │   ├── tools_news.py          # News scraping tools
│   │   ├── tools_docs.py          # Document processing tools
│   │   ├── tools_data.py          # Data analysis tools
│   │   ├── tools_visualization.py # Chart generation
│   │   └── tools_report.py        # Report generation
│   ├── models/
│   │   └── schemas_tasks.py       # Pydantic schemas
│   ├── static/
│   │   ├── style.css              # Frontend styles
│   │   └── app.js                 # Frontend JavaScript
│   ├── templates/
│   │   └── index.html             # Web UI template
│   ├── charts/                    # Generated charts (gitignored)
│   └── reports/                   # Generated reports (gitignored)
├── data/                          # Data files (gitignored)
├── logs/                          # Application logs (gitignored)
├── models/                        # Trained ML models
├── uploads/                       # Uploaded files (gitignored)
├── tests/
│   ├── test_api.py                # API tests
│   └── test_ml.py                 # ML model tests
├── examples/
│   └── usage_example.py           # API usage examples
├── .env                           # Environment variables (create this)
├── .gitignore                     # Git ignore rules
├── requirements.txt               # Python dependencies
├── runtime.txt                    # Python version for Render
├── render.yaml                    # Render deployment config
└── README.md                      # This file
```

---

## 🧪 Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=app tests/

# Run specific test file
pytest tests/test_api.py
```

---

## 📋 Example Usage

Check out `examples/usage_example.py` for comprehensive API usage examples:

```bash
python examples/usage_example.py
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Ritik Gupta**

- GitHub: [@ritik-gupta001](https://github.com/ritik-gupta001)
- Repository: [NexanalyzeAI--Transform-Data-Into-Insights](https://github.com/ritik-gupta001/NexanalyzeAI--Transform-Data-Into-Insights)

---

## 🙏 Acknowledgments

- OpenAI for GPT models
- FastAPI team for the amazing framework
- LangChain for LLM orchestration tools
- The open-source community

---

## 💬 Support

For support, please open an issue on GitHub or contact through the repository.

---

<div align="center">
  Made with ❤️ by Ritik Gupta
  <br><br>
  ⭐ Star this repo if you find it helpful!
</div>

