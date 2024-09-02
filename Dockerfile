# Usa la imagen oficial de Python como imagen base
FROM python:3.9

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo requirements.txt al contenedor
COPY requirements.txt /app/

# Instala las dependencias listadas en requirements.txt usando pip
RUN pip install --no-cache-dir -r requirements.txt

# Copia el contenido de la carpeta local app al contenedor
COPY ./app /app

# Configura las variables de entorno necesarias
ENV FLASK_APP=app.py
ENV MYSQL_HOST=mysql
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=password
ENV MYSQL_DB=my_db

# Expone el puerto 5000 en el contenedor
EXPOSE 5000

# Comando por defecto para ejecutar la aplicación Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
