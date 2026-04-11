#!/bin/bash
# Generate autumn-properties.json from environment variables before starting the bot

CONFIG_FILE="/app/autumn-properties.json"

# Only generate if env vars are set (don't overwrite manual config)
if [ -n "$SHAREBOT_TOKEN" ]; then
    cat > "$CONFIG_FILE" <<EOJSON
{
    "TELEGRAMM": {
        "TOKEN": "${SHAREBOT_TOKEN:-}",
        "USERS": "${SHAREBOT_USERS:-}",
        "GROUPS": "${SHAREBOT_GROUPS:-}"
    },
    "GIST": {
        "TOKEN": "${SHAREBOT_GIST_TOKEN:-}",
        "NAME": "${SHAREBOT_GIST_NAME:-}"
    },
    "GITLAB": {
        "URL": "${SHAREBOT_GITLAB_URL:-}",
        "TOKEN": "${SHAREBOT_GITLAB_TOKEN:-}",
        "PROJECTID": "${SHAREBOT_GITLAB_PROJECTID:-}"
    },
    "PASTE1C": {
        "HEADER": "${SHAREBOT_PASTE1C_HEADER:-sharebsl_bot}"
    },
    "UNPACK": "${SHAREBOT_UNPACK:-py}",
    "SHARESERVICE": "${SHAREBOT_SHARESERVICE:-ПубликаторGist}",
    "FILEMAXSIZE": ${SHAREBOT_FILEMAXSIZE:-20000000},
    "data": {
        "ИсточникиДанных": {
            "ТипКоннектора": "КоннекторJSON",
            "СтрокаСоединения": "./DataBase"
        }
    },
    "logos": {
        "logger": {
            "oscript.lib.share_bsl": {"level":"${SHAREBOT_LOG_LEVEL:-DEBUG}", "stringlayout":"%Уровень%:%ДатаВремя% - %Сообщение%"}
        }
    }
}
EOJSON
    echo "Config generated from environment variables"
fi

exec "$@"
