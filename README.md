# 🛡️ Checkmk RAW 2.4.x en Docker

Herramienta profesional de Checkmk RAW Edition usando Docker Compose.

Fue ejecutado en **Debian 12 sin entorno gráfico de 64 bits**.

---

## 🚀 ¿Qué es Checkmk?

Es una solución avanzada de monitorización de infraestructura TI que permite a las organizaciones supervisar, administrar y mantener de forma eficiente sus sistemas, redes, aplicaciones y servicios.

Su arquitectura modular y escalable facilita la recopilación de métricas en tiempo real, la detección proactiva de anomalías y la gestión centralizada de eventos, lo que contribuye a una operación más segura y optimizada del entorno tecnológico.

## 🛠️ Instalación y uso

### 1. Actualizar paquetes, instalar herramientas necesarias (con usuario estandar)

su -c "apt update && apt upgrade"

su -c "apt install git -y"

su -c "apt-get install ca-certificates curl"

### 2. Clonar el repositorio, ingresar a ese directorio y dar permiso de ejecución al script

git clone https://github.com/Chelo2025/Docker-Checkmk

cd Docker-Checkmk

chmod +x docker-repo.sh

### 3. Ejecución del script y luego instalar docker y docker compose

su -c "./docker-repo.sh"

su -c "apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"

### 4. Verificar el estado del servicio, añadirlo al arranque, con opcional de ejecutar Docker sin ser root.

su -c "systemctl --no-pager status docker && systemctl enable docker"

su -c "/usr/sbin/usermod -aG docker "$(logname)""

### 5. Checkmk con Docker Compose (podemos visualizar con cat)

cat docker-compose.yml

### 6. Levantar el servicio, verificar que este corriendo y mostrar los registros para obtener el usuario con la contraseña.

docker compose up -d

docker ps

docker logs -f monitoring

### 7. Ver en el navegador web con la ip del servidor

http://localhost:8080

Usuario: cmkadmin

Contraseña: creada aleatoria ver: docker logs -f monitoring

## Estructura

Volumen monitoring guarda la configuración y datos históricos de Checkmk.


## Buenas prácticas recomendadas

Restringir puertos en firewall.

Mantener actualizado Docker y Checkmk.

Realizar backups periódicos del volumen monitoring.


## 👨‍💻 Autor

### Marcelo Martinez - Chelo2025

🎓 Estudiante de Licenciatura en Tecnologías Digitales

🛡️ Técnico Superior en Redes Informáticas

🎓 Estudiante en Diplomado en Administración de Redes Linux, Ciberseguridad y Hacking Ético

🔗 GitHub: https://github.com/Chelo2025