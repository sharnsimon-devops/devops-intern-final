FROM python:3.11.9-slim

WORKDIR /app

COPY hello.py .

RUN useradd --no-create-home appuser
USER appuser

CMD ["python", "hello.py"]
