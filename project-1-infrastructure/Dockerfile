FROM node:18-alpine
WORKDIR /usr/src/
COPY package.json ./
RUN npm install --only=production
COPY . .
EXPOSE 
CMD ["npm", "start"]
