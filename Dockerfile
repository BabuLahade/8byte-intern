#FROM
FROM node:18-alpine

# WORKDIR
WORKDIR /app

# COPY
COPY app/package*.json ./
RUN npm install

COPY app/app.js .

#PORT EXPOSE
EXPOSE 3000

# commands
CMD ["node","app.js"]
