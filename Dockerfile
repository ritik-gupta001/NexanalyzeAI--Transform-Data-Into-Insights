# Use Python 3.10 slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create necessary directories
RUN mkdir -p logs data uploads models app/charts app/reports

# Expose port (for local Docker use)
EXPOSE 8000

# Run the application
# Note: For Vercel deployment, this Dockerfile is optional as Vercel uses serverless functions
# This Dockerfile is maintained for local Docker development and alternative deployment options
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
