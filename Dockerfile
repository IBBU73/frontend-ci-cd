FROM node:22-alpine 

WORKDIR /app

COPY package*.json ./ 

COPY . .

RUN npm install

EXPOSE 4100

CMD ["npm" , "start"]
