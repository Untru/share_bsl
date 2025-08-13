FROM evilbeaver/onescript:dev

WORKDIR /app

COPY ./packagedef .
COPY ./autumn-properties.json .

COPY ./src ./src
COPY ./DataBase ./DataBase
COPY ./main.os .

RUN opm install opm \
  && opm build . \
  && cp share-bot-*.ospx bot.ospx \
  && opm install -f bot.ospx

RUN apt-get update
RUN apt-get install -y -y python3 python3-pip
RUN pip3 install v8unpack
RUN opm ls
CMD ["share-bot"]
