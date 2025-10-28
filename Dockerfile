FROM python:3.13.5 AS builder
# Set working directory
WORKDIR /app

# Install system dependencies required for ML libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies with verbose logging
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt --verbose

# Copy application source files and model weights
COPY web_asean.py ./
COPY languages.py ./
COPY gpt_prompt.py ./
RUN mkdir -p /app/models
COPY best_jitter.pth .
COPY image_tensor.pt .
COPY .env .

# Expose the port the app runs on
EXPOSE 8501

# Run Streamlit app
CMD ["streamlit", "run", "web_asean.py", "--server.port=8501", "--server.address=0.0.0.0", "--server.headless=true", "--server.fileWatcherType=none"]
