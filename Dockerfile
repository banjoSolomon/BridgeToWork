#dockrfile
FROM python:3.9-slim

WORKDIR /app

COPY todo.py .

CMD ["python", "todo.py"]
