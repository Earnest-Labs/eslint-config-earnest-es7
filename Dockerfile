FROM node:10

ARG NPM_TOKEN  
COPY .npmrc .npmrc  
COPY package.json package.json
COPY . .  
RUN yarn install
RUN yarn publish
RUN rm -f .npmrc

CMD npm start