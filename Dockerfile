FROM node

WORKDIR /app

COPY app.js /app

EXPOSE 3000

ENTRYPOINT ["node", "app.js"]

