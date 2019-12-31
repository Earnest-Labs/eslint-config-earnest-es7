FROM risingstack/alpine:3.3-v4.3.1-3.0.1

ARG NPM_TOKEN  
COPY .npmrc .npmrc  
COPY package.json package.json
npm install npm@latest -g
RUN npm install  
RUN npm install autopublish
RUN ./node_modules/.bin/autopublish .
RUN rm -f .npmrc

# Add your source files
COPY . .  
CMD npm start