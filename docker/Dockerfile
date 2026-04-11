FROM evilbeaver/onescript:dev

# Replace OneScript engine from rc.9 to 2.0.0 stable + install python3 for v8unpack
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip python3 python3-pip \
  && curl -fsSL https://github.com/EvilBeaver/OneScript/releases/download/v2.0.0/OneScript-2.0.0-linux-x64.zip -o /tmp/oscript.zip \
  && unzip -o /tmp/oscript.zip -d /tmp/oscript-new \
  && cp -f /tmp/oscript-new/bin/oscript /var/oscript/bin/oscript \
  && cp -f /tmp/oscript-new/bin/*.dll /var/oscript/bin/ \
  && rm -rf /tmp/oscript.zip /tmp/oscript-new \
  && pip3 install v8unpack \
  && apt-get purge -y curl unzip && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# Update opm (old semver lib can't parse some version formats)
RUN opm install opm

WORKDIR /app

COPY ./packagedef .
COPY ./src ./src
COPY ./main.os .
COPY ./autumn-properties.json .
COPY ./oscript.cfg.example ./oscript.cfg

RUN mkdir -p /app/DataBase

RUN opm build . \
  && cp share-bot-*.ospx bot.ospx \
  && opm install -f bot.ospx

CMD ["share-bot"]
