FROM node:19-alpine

WORKDIR /hello

ADD . /hello/

RUN yarn install


EXPOSE  3000

CMD ["yarn","run", "start"]

