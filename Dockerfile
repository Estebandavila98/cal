FROM ubuntu:20.04

# 1. Instalamos dependencias básicas
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      build-essential \
      curl \
      gcc \
      libssl-dev \
      pkg-config && \
    rm -rf /var/lib/apt/lists/*

# 2. Instalamos Rust vía rustup (instalación por defecto)
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# 3. Ponemos cargo en el PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# 4. Copiamos el proyecto y compilamos
WORKDIR /app
COPY . .
RUN cargo build

# 5. Ejecutable por defecto, con stdin/TTY habilitado
CMD ["./target/debug/cal"]
