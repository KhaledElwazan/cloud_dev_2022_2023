FROM node:20-alpine3.16

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_ENV=production

ENV PORT=3000
ENV WORK_DIR=/my_app

WORKDIR $WORK_DIR

COPY  main.js $WORK_DIR
COPY package.json $WORK_DIR
COPY person.js $WORK_DIR

RUN npm install --loglevel=warn

EXPOSE ${PORT}

CMD node main.js