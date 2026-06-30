# Nexalyze AI — Transform Data Into Insights

An autonomous multi-agent platform for document/data analysis and automated report generation, built on FastAPI and the OpenAI API.

## Overview

Nexalyze AI combines a direct OpenAI LLM integration, classic ML (scikit-learn), and data-processing tooling to:

- Generate entity-based "news" summaries and sentiment/trend analysis 
- Extract insights from uploaded PDF, DOCX, and TXT documents
- Analyze CSV/Excel data for patterns, anomalies, and forecasts
- Generate professional reports (Markdown, PDF, DOCX)
- Produce charts and visualizations automatically

## Tech Stack 

- **Web framework:** FastAPI, Uvicorn (ASGI server)
- **Validation/config:** Pydantic, pydantic-settings
- **Database:** SQLAlchemy (ORM) with SQLite
- **AI/LLM:** OpenAI Python SDK, called directly (`from openai import OpenAI`) —
- **ML:** scikit-learn (`TfidfVectorizer`, `LogisticRegression`, `LinearRegression`), numpy, pandas
- **Document processing:** PyPDF2 (PDF text extraction), python-docx (DOCX read/write)
- **Visualization:** Matplotlib, Seaborn
- **Report generation:** fpdf (PDF), markdown
- **Logging:** loguru
- **Frontend:** HTML5, CSS3, vanilla JavaScript (served as static files/Jinja templates by FastAPI)
- **Containerization:** Docker

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    FastAPI Backend                      │
├─────────────────────────────────────────────────────────┤
│  REST API  │  Static Files  │  Jinja Templates           │
├─────────────────────────────────────────────────────────┤
│              Agent Orchestrator (custom Python)          │
├─────────────┬──────────────┬─────────────┬──────────────┤
│ Mock News    │  Doc Parser  │ Data Analyzer│  OpenAI LLM │
│ Generator    │ (PyPDF2/docx)│  (pandas)    │   Client    │
├─────────────┴──────────────┴─────────────┴──────────────┤
│   ML Models (scikit-learn: sentiment, linear forecast)   │
├─────────────────────────────────────────────────────────┤
│            SQLite Database (Task Storage)                │
└─────────────────────────────────────────────────────────┘
```

## Project Structure

```
nexalyze-ai/
├── app/
│   ├── main.py                    # FastAPI application entry point
│   ├── api/
│   │   ├── routes_health.py       # Health check endpoints
│   │   └── routes_tasks.py        # Task management endpoints
│   ├── core/
│   │   ├── config.py              # Configuration management
│   │   └── logger.py              # Logging setup (loguru)
│   ├── db/
│   │   ├── base.py                # SQLAlchemy engine and session
│   │   ├── models.py              # SQLAlchemy models
│   │   └── init_db.py             # Database initialization
│   ├── genai/
│   │   ├── llm_client.py          # Direct OpenAI SDK integration
│   │   └── prompts.py             # LLM prompt templates
│   ├── ml/
│   │   ├── sentiment_ml.py        # scikit-learn sentiment analysis
│   │   ├── sentiment_dl.py        # Alternative sentiment model
│   │   └── forecast_model.py      # Trend forecasting
│   ├── services/
│   │   ├── agent_orchestrator.py  # Task interpretation & orchestration 
│   │   ├── tools_news.py          # Mock/templated news generation 
│   │   ├── tools_docs.py          # Document parsing 
│   │   ├── tools_data.py          # CSV/Excel analysis (pandas)
│   │   ├── tools_visualization.py # Chart generation
│   │   └── tools_report.py        # Report generation
│   ├── models/
│   │   └── schemas_tasks.py       # Pydantic request/response schemas
│   ├── static/
│   │   ├── style.css
│   │   └── app.js
│   ├── templates/
│   │   └── index.html             # Web UI template
│   ├── charts/                    # Generated charts (gitignored)
│   └── reports/                   # Generated reports (gitignored)
├── data/                          # Data files (gitignored)
├── logs/                          # Application logs (gitignored)
├── models/                        # Trained ML models
├── uploads/                       # Uploaded files (gitignored)
├── tests/
│   ├── test_api.py
│   └── test_ml.py
├── examples/
│   └── usage_example.py
├── Dockerfile
├── render.yaml                    # Render.com deployment config
├── requirements.txt
└── README.md
```

## Prerequisites

- Python 3.10+
- An OpenAI API key
- pip

## Installation

```bash
git clone https://github.com/ritik-gupta001/NexanalyzeAI--Transform-Data-Into-Insights.git
cd NexanalyzeAI--Transform-Data-Into-Insights

# Create and activate a virtual environment
python -m venv .venv
source .venv/bin/activate      # Windows: .venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

Create a `.env` file in the project root:

```
OPENAI_API_KEY=your_openai_api_key_here
APP_NAME=Nexalyze AI
APP_VERSION=1.0.0
ENVIRONMENT=development
HOST=0.0.0.0
PORT=8000
API_V1_PREFIX=/api/v1
DATABASE_URL=sqlite:///./pra_database.db
```

## Running the App

```bash
# Development (auto-reload)
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

# Production
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

- Web UI: `http://127.0.0.1:8000`
- Swagger docs: `http://127.0.0.1:8000/docs`
- ReDoc: `http://127.0.0.1:8000/redoc`

## API Endpoints

| Method | Endpoint                        | Purpose                                  |
|--------|----------------------------------|-------------------------------------------|
| GET    | `/api/v1/health`                 | Health check                              |
| POST   | `/api/v1/tasks/analyze-text`     | Analyze text/news for sentiment & trends  |
| POST   | `/api/v1/tasks/analyze-doc`      | Analyze an uploaded PDF/DOCX/TXT file     |
| POST   | `/api/v1/tasks/analyze-data`     | Analyze an uploaded CSV/Excel file        |
| GET    | `/api/v1/tasks/{task_id}`        | Get status/result of a task               |
| GET    | `/api/v1/tasks/?page=&page_size=`| List all tasks (paginated)                |

### Example: analyze text

```bash
curl -X POST http://127.0.0.1:8000/api/v1/tasks/analyze-text \
  -H "Content-Type: application/json" \
  -d '{
    "query": "Analyze recent news about Tesla and predict sentiment trend",
    "entity": "Tesla",
    "time_range": "last_7_days"
  }'
```

### Example response

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

## Running Tests

```bash
pytest
pytest --cov=app tests/
pytest tests/test_api.py
```

## Example Usage Script

```bash
python examples/usage_example.py
```

## Docker

```bash
docker build -t nexalyze-ai .
docker run -p 8000:8000 --env-file .env nexalyze-ai
```

The included `Dockerfile` is based on `python:3.10-slim`, installs `requirements.txt`, and starts the app via `uvicorn app.main:app`.

## Deployment

The repo includes a `render.yaml` for one-click deployment to [Render](https://render.com) using the included Dockerfile. SQLite is used for storage by default; for persistent data across redeploys, swap in a managed Postgres instance.

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## License

MIT License — see the `LICENSE` file for details.

## Author

**Ritik Gupta** — [@ritik-gupta001](https://github.com/ritik-gupta001)
