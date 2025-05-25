FROM n8nio/n8n

USER root
RUN apk --no-cache add python3 ffmpeg imagemagick-dev imagemagick py3-pip

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    wget \
    # Additional common dependencies for Chrome on Linux that might not be in your initial list
    # but are often helpful or required:
    gconf-service \
    libappindicator1 \
    libnss3-dev \
    libxkbcommon0 \
    lsb-release \
    # Clean up apt caches to keep image size down
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN npm install -g baileys lodash baileys bcrypt body-parser puppeteer

USER node

RUN python3 -m pip install --user --break-system-packages pipx
# Set the working directory inside the container

ENV PATH="/home/node/.local/bin:$PATH"
# Expose the port n8n runs on (default is 5678)
EXPOSE 5678

# The default command to run n8n will be inherited from the base image,
# but you can override it if necessary.
# CMD ["n8n", "start"]
