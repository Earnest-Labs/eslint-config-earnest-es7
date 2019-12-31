FROM node:10

ARG NPM_TOKEN  
COPY .npmrc .npmrc  
COPY package.json package.json
RUN npm install autopublish
RUN ./node_modules/.bin/autopublish .
RUN rm -f .npmrc

# Add your source files
COPY . .  
CMD npm start