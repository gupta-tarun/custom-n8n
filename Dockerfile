FROM n8n/n8n

# Set the working directory inside the container
WORKDIR /usr/local/bin/n8n

# Install your custom npm packages
# Replace 'your-package-name' with the actual package names you want to install
# You can add multiple RUN npm install lines or combine them
RUN npm install baileys
RUN npm install @actual-app/api # Example with specific version
RUN npm install lodash

# If you have a package.json for your custom nodes/packages, you can copy it and then install
# COPY package.json .
# RUN npm install

# Expose the port n8n runs on (default is 5678)
EXPOSE 5678

# The default command to run n8n will be inherited from the base image,
# but you can override it if necessary.
# CMD ["n8n", "start"]
