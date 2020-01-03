FROM nodesource/jessie:0.12.7

ARG NPM_TOKEN  
COPY .npmrc .npmrc  
COPY package.json package.json
COPY . .  
RUN npm install
RUN npm publish
RUN rm -f .npmrc

CMD npm start