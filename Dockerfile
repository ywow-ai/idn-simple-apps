FROM node:18.20-slim
WORKDIR /app
ADD . /app
RUN yarn install
EXPOSE 3000
CMD ["yarn", "start"]
