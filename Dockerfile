FROM python:3.10-slim

# Instalar dependencias del sistema operativo en el servidor de la nube
RUN apt-get update && apt-get install -y \
    lilypond \
    timidity \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar e instalar librerías de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el código del proyecto
COPY . .

EXPOSE 5000

# Arrancar con un servidor WSGI de producción
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]