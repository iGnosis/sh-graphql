# Introduction
SoundHealth uses Hasura GraphQL engine to quicky setup APIs. Read more at: <https://hasura.io/docs/latest/index/>

To setup on a server, you can do that easily using Docker. You can use `docker-compose.prod.yaml` file for reference, alternatively, you can refer Hasura docs. <https://hasura.io/docs/latest/deployment/deployment-guides/docker/>

Even if you have decided to setup Hasura on a server, you will need to setup this repository on your development machine. This is necessary to keep track of database changes you make. The changes are later applied to server via a CI/CD pipeline.

# Database Migrations and Hasura Metadata

Hasura has a CLI which will help you save each action that you do on the Hasura console, including creating tables/views and schema modifying SQL statements, as SQL files. These files are called migrations and they can be applied and rolled back step-by-step. These files can be version controlled and can be used with your CI/CD system to make incremental updates.

To use migrations effectively, all changes must go through the console served by the CLI. Otherwise, changes could be made through the server console and they will not be tracked by migrations.

## Install Hasura CLI
The Hasura CLI is a command line tool which is the primary mode of managing Hasura projects and migrations.

Install it from https://hasura.io/docs/latest/graphql/core/hasura-cli/install-hasura-cli/

## Install Docker and Docker Compose
- https://docs.docker.com/get-docker/
- https://docs.docker.com/compose/install/

## Opening Hasura console
- cd to `sh_graphql`
- create a new file `config.yaml` with the contents of `config.sample.yaml`
- run `docker compose up -d` (it can take a few minutes)
- run `./run.sh` script

Open the console that gets served, any change to schema / GraphQL APIs you make should now be tracked in this repository. <strong>Do not forget to commit your changes periodically so that they can be published across the environments</strong>

## Adding a new secret
- add secret to `.env.sample`file so we can track it
- add secret to `.env` file
- add secret variable to docker-compose file
- run `npm run reload-env`
