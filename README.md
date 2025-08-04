# 1) Con Docker CLI (sin Compose)
# ------------------------------------------------
# Construir imagen
docker build -t cal-rust .

# Ejecutar interactivo, sin --rm (el contenedor quedará “Exited” al salir)
docker run -it --name cal-container cal-rust

# Ahora, tras Ctrl+D, el contenedor sigue existiendo:
docker ps -a            # verás "cal-container" en estado Exited


# 2) Con Docker Compose
# ------------------------------------------------
# Construir según docker-compose.yml
docker compose build

# Ejecutar el servicio interactivo, sin --rm
docker compose run --name cal-compose calculadora

# Tras Ctrl+D, el contenedor cal-compose quedará detenido:
docker ps -a            # verás el contenedor con nombre "cal-compose"

#borrar todoo
docker system prune -af --volumes 