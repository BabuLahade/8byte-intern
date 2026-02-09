#FROM
FROM node:18-alpine

# WORKDIR
WORKDIR /app

# COPY
COPY package*.json ./
RUN npm install

COPY . .

#PORT EXPOSE
EXPOSE 3000

# commands
CMD ["node","app.js"]