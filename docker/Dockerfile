FROM evilbeaver/onescript:dev

WORKDIR /app

COPY ./packagedef .

COPY ./src ./src
COPY ./main.os .

RUN opm install opm && opm build && cp share-bot-*.ospx bot.ospx && opm install -f bot.ospx

CMD ["share-bot"]
