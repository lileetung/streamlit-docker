# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Clone the GitHub repository (replace with your own repo URL)
RUN git clone https://github.com/lileetung/streamlit-docker.git .

# Install Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose the port that Streamlit uses
EXPOSE 8501

# Add a health check to verify if the app is running
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD curl --fail http://localhost:8501/_stcore/health || exit 1

# Use ENTRYPOINT to ensure Streamlit starts when the container runs
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
