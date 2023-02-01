#!/usr/bin/env bash
hasura console \
    --skip-update-check \
    --no-browser
    # --endpoint ${HASURA_ENDPOINT} \
    # --admin-secret ${HASURA_ADMIN_SECRET} \
    # --console-port ${HASURA_CONSOLE_PORT} \
