# A repo to keep track of database Migrations and Hasura metadata

Hasura has a CLI which will help you save each action that you do on the console, including creating tables/views and schema modifying SQL statements, as SQL files. These files are called migrations and they can be applied and rolled back step-by-step. These files can be version controlled and can be used with your CI/CD system to make incremental updates.

To use migrations effectively, all changes must go through the console served by the CLI. Otherwise, changes could be made through the server console and they will not be tracked by migrations.

## Set-up Hasura CLI
The Hasura CLI is a command line tool which is the primary mode of managing Hasura projects and migrations.

Install it from https://hasura.io/docs/latest/graphql/core/hasura-cli/install-hasura-cli/

## Set-up the following environment variables.
```
HASURA_ENDPOINT
HASURA_ADMIN_SECRET
HASURA_CONSOLE_PORT
```
## Opening a Hasura console
Run `run.sh`, open the console that gets served, any change to schema / GraphQL APIs you make should now be tracked in this repository. <strong>Do not forget to commit your changes periodically so that they can be published across the environments</strong>

# TODO
- disable stage and dev Hasura console
