# Example: Build on a Debian-based Node.js image
# Or node:18-slim-bullseye, etc. bullseye is Debian 11
FROM node:20-slim


# Install necessary system dependencies for Chrome/Chromium
# Use apt-get here as it's a Debian base
RUN apt-get update && apt-get upgrade -y \
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
    gconf-service \
    libappindicator1 \
    libnss3-dev \
    libxkbcommon0 \
    lsb-release \
    # Clean up apt caches
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Now, install n8n itself and switch to its user
# This part would replicate how n8n's official Dockerfiles install n8n
# You'd need to look at their Dockerfile for the exact steps,
# but it generally involves installing n8n globally with npm.
# For example:
RUN npm install -g n8n@latest --unsafe-perm --allow-root

# RUN npm install -g baileys --unsafe-perm --allow-root

RUN npm install -g lodash --unsafe-perm --allow-root

RUN npm install -g puppeteer --unsafe-perm --allow-root

RUN npm install -g bcrypt --unsafe-perm --allow-root

# Set the user for n8n to run as (often 'node' for node:slim images)
# USER node

# Set the working directory, expose port, define entrypoint etc.
WORKDIR /home/node/.n8n

EXPOSE 5678
ENTRYPOINT ["n8n"]
