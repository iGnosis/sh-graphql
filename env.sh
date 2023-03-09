cp -n ./config.sample.yaml ./config.yaml
cp -n ./.env.sample ./.env
docker compose --env-file .env up -d --force-recreate
