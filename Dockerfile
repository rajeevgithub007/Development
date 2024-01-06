FROM node:18.14.0
COPY . /src
RUN cd /src && npm install
EXPOSE 4000
CMD ["node", "/src/server.js"]
