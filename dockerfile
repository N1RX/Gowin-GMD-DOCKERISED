FROM --platform=linux/amd64 ubuntu:22.04

# Install required GUI tools and toolchain for ARM Cortex development
RUN apt-get update && apt-get install -y \
    x11-apps \
    gcc-arm-none-eabi \
    gdb-arm-none-eabi \
    make \
    cmake \
    build-essential \
    libswt-gtk-4-java \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# Create application directory
RUN mkdir -p /app

# Set working directory
WORKDIR /app

# Copy all matching GMD*.tar.gz archives to the container
COPY GMD*.tar.gz /app/

# Extract the first matching GMD*.tar.gz archive and remove it
RUN ARCHIVE=$(ls GMD*.tar.gz | head -n 1) && \
    tar -xzf "$ARCHIVE" --strip-components=1 && \
    rm "$ARCHIVE"

# Make main binary executable
RUN chmod +x ./GMD

# Default command to launch the GUI app
CMD ["./GMD"]
