# Utilizar una imagen oficial y ligera de Python 3.10
FROM python:3.10-slim

# Variables de entorno para evitar la generación de archivos .pyc y asegurar una salida limpia en consola
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalar dependencias del sistema operativo necesarias para compilar paquetes y conectar con PostgreSQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar e instalar las dependencias de Python listadas en requirements.txt
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiar el resto del código fuente del proyecto al contenedor
COPY . /app/

# Exponer el puerto predeterminado en el que corre Django
EXPOSE 8000

# Comando por defecto para iniciar el servidor de desarrollo de Django
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]