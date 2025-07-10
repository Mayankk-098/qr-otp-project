FROM mcr.microsoft.com/playwright/python:v1.44.0-jammy

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

# Explicitly install browsers again (guaranteed fix)
RUN playwright install

EXPOSE 5000

CMD ["python", "app.py"] 