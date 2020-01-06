FROM node:10

ARG NPM_TOKEN  
COPY .npmrc .npmrc  
COPY package.json package.json
COPY . .  
RUN npm deprecate @earnest/eslint-config-es7@5.0.0 "The publishing of v5.0.0 failed, and it should not be used. Please revert to 4.0.3 until a newer version is published."
RUN rm -f .npmrc

CMD npm start