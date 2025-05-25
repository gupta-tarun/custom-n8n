FROM n8nio/n8n

USER root
RUN apk --no-cache add python3 ffmpeg imagemagick-dev imagemagick py3-pip
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
