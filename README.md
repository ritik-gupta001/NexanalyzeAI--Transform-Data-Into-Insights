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

## 🌐 Vercel Deployment Guide

### 🚀 Deploy to Vercel (Serverless Platform)

Vercel provides seamless serverless deployment with automatic scaling, global CDN, and zero-configuration deployment.

#### Prerequisites
- GitHub account with your repository pushed
- Vercel account ([Sign up free](https://vercel.com/signup))
- OpenAI API Key

---

### Method 1: Deploy via Vercel Dashboard (Recommended)

#### Step 1: Connect to Vercel
1. Visit [vercel.com/new](https://vercel.com/new)
2. Click **"Continue with GitHub"** to sign in
3. Authorize Vercel to access your GitHub repositories

#### Step 2: Import Your Repository
1. Click **"Import Project"** or **"Add New Project"**
2. Select **"Import Git Repository"**
3. Find and select: `NexanalyzeAI--Transform-Data-Into-Insights`
4. Click **"Import"**

#### Step 3: Configure Project Settings
- **Framework Preset**: Other
- **Root Directory**: `./` (leave as default)
- **Build Command**: (leave empty or default)
- **Output Directory**: (leave empty or default)
- **Install Command**: `pip install -r requirements.txt`

#### Step 4: Add Environment Variables
Click **"Environment Variables"** section and add:

| Key | Value | Environment |
|-----|-------|-------------|
| `OPENAI_API_KEY` | `your_openai_api_key_here` | Production, Preview, Development |
| `ENVIRONMENT` | `production` | Production |
| `DATABASE_URL` | `sqlite:///./pra_database.db` | All |
| `APP_NAME` | `Nexalyze AI` | All |
| `HOST` | `0.0.0.0` | All |
| `PORT` | `8000` | All |

💡 **Tip**: Get your OpenAI API key from [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

#### Step 5: Deploy
1. Click **"Deploy"** button
2. Wait 1-2 minutes for the build to complete
3. Once deployed, you'll see: ✅ **"Deployment Ready"**

#### Step 6: Access Your Application
- **Production URL**: `https://your-project-name.vercel.app`
- **Health Check**: `https://your-project-name.vercel.app/api/v1/health`
- **API Documentation**: `https://your-project-name.vercel.app/docs`
- **Interactive API**: `https://your-project-name.vercel.app/redoc`

---

### Method 2: Deploy via Vercel CLI

#### Step 1: Install Vercel CLI
```bash
npm install -g vercel
```

#### Step 2: Login to Vercel
```bash
vercel login
```

#### Step 3: Deploy
```bash
# Navigate to project directory
cd NexanalyzeAI--Transform-Data-Into-Insights

# Deploy to preview
vercel

# Deploy to production
vercel --prod
```

#### Step 4: Set Environment Variables
```bash
vercel env add OPENAI_API_KEY production
vercel env add ENVIRONMENT production
vercel env add DATABASE_URL production
```

---

### 🔄 Automatic Deployments

Once connected, Vercel automatically deploys:
- ✅ **Production**: Every push to `main` branch
- 🔍 **Preview**: Every push to feature branches
- 📝 **PR Previews**: Every pull request gets its own URL

---

### 📊 Post-Deployment Checklist

- [ ] Verify health endpoint: `/api/v1/health`
- [ ] Test API documentation: `/docs`
- [ ] Check environment variables in Vercel Dashboard
- [ ] Test file upload functionality
- [ ] Verify AI analysis features work
- [ ] Check logs in Vercel Dashboard → Deployment → Logs
- [ ] (Optional) Add custom domain in Settings → Domains

---

### 🛠️ Vercel Project Structure

```
project-root/
├── api/
│   └── index.py           # Vercel serverless entry point
├── app/
│   ├── main.py            # FastAPI application
│   ├── api/               # API routes
│   ├── core/              # Core configuration
│   ├── db/                # Database models
│   ├── genai/             # AI/LLM integration
│   ├── ml/                # ML models
│   ├── services/          # Business logic
│   └── ...
├── vercel.json            # Vercel configuration
├── requirements.txt       # Python dependencies
└── README.md
```

---

### ⚙️ Vercel Configuration (`vercel.json`)

```json
{
  "version": 2,
  "builds": [
    {
      "src": "app/main.py",
      "use": "@vercel/python"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "app/main.py"
    }
  ]
}
```

---

### 🔍 Troubleshooting

#### Build Fails
- Check Python version compatibility (3.10+)
- Verify all dependencies in `requirements.txt`
- Check build logs in Vercel Dashboard

#### Environment Variables Not Working
- Ensure variables are added to all environments
- Redeploy after adding new variables
- Check variable names match exactly (case-sensitive)

#### API Returns 404
- Verify `vercel.json` configuration
- Check that `api/index.py` exists
- Ensure routes in FastAPI are correct

#### Cold Starts / Slow Response
- Vercel serverless functions have cold starts (~1-3s)
- Consider upgrading to Vercel Pro for faster cold starts
- Optimize imports and initialization in your code

---

### 📈 Vercel Features & Benefits

| Feature | Free Tier | Pro Tier |
|---------|-----------|----------|
| Deployments | Unlimited | Unlimited |
| Bandwidth | 100 GB/month | 1 TB/month |
| Build Time | 100 hours/month | 400 hours/month |
| Serverless Functions | 12 seconds timeout | 60 seconds timeout |
| Custom Domains | ✅ Yes | ✅ Yes |
| SSL Certificates | ✅ Free | ✅ Free |
| GitHub Integration | ✅ Yes | ✅ Yes |
| Preview Deployments | ✅ Yes | ✅ Yes |
| Analytics | Basic | Advanced |
| Team Members | 1 | Unlimited |

---

### 🎯 Why Vercel?

- ⚡ **Zero Configuration**: Deploy with one click
- 🌍 **Global CDN**: Fast response times worldwide
- 🔄 **Automatic CI/CD**: Push to deploy
- 📊 **Built-in Analytics**: Monitor performance
- 🔒 **SSL by Default**: Free HTTPS certificates
- 🎨 **Preview Deployments**: Test before production
- 📈 **Auto Scaling**: Handle traffic spikes automatically

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

