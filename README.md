# Gowin GMD DOCKERISED

This should help to get the Gowin GMD running on an Apple Silicon Mac with Docker.

# Installation
1. Install Docker Desktop for Mac (https://www.docker.com/products/docker-desktop)
2. Clone this repository: `git clone https://github.com/yourusername/gowin-gmd-docker.git`
3. Get the Gowin GMD software from the official website (https://www.gowinsemi.com/en/support/download_eda/) and place the `GMD*.tar.gz` file in the cloned directory.
4. Install XQuartz with brew `brew install --cask xquartz`
5. Start XQuartz and allow connections from network clients (XQuartz > Preferences > Security > Allow connections from network clients). Resrtart XQuartz if necessary.
6. Open a terminal and run the following command to allow Docker to access the X11 server:
   ```bash
   xhost +
   ```
7. run the Docker container:
   ```bash
   docker-compose up --build
   ```