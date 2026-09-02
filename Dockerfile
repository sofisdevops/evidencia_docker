FROM python:3.14-slim

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

WORKDIR /home/evidencia

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --force-reinstall "wheel>=0.46.2" "setuptools>=78.1.1" "msgpack>=1.2.1"

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

EXPOSE 5050

CMD ["python3", "app.py"]