
# Deno (deno-postgres)

Develop Deno+Postgres based applications. Includes Deno, Postgres, Node.js, npm, etc.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| denoVersion | Deno version (use -bookworm, -bullseye variants on local arm64/Apple Silicon): | string | 1.40.2 |
| postgresVersion | Postgres version: | string | 16 |

This template references an image that was [pre-built](https://containers.dev/implementors/reference/#prebuilding) to automatically include needed devcontainer.json metadata.

* **Image**: mcr.microsoft.com/devcontainers/typescript-node ([source](https://github.com/devcontainers/images/tree/main/src/typescript-node))
* **Applies devcontainer.json contents from image**: Yes ([source](https://github.com/devcontainers/images/blob/main/src/typescript-node/.devcontainer/devcontainer.json))

## Using this template

This definition creates two containers, one for Deno and one for PostgreSQL. You will be connected to the Deno container, and from within that container the PostgreSQL container will be available on **`localhost`** port 5432. The default database is named `postgres` with a user of `postgres` whose password is `postgres`, and if desired this may be changed in `docker-compose.yml`. Data is stored in a volume named `postgres-data`.

While the definition itself works unmodified, it uses `mcr.microsoft.com/devcontainers/typescript-node` as a base image which includes `git`, `eslint`, `zsh`, [Oh My Zsh!](https://ohmyz.sh/), a non-root `vscode` user with `sudo` access, and a set of common dependencies for development.

You also can connect to PostgreSQL from an external tool when connected to the Dev Contaner from a local tool  by updating `.devcontainer/devcontainer.json` as follows:

```json
"forwardPorts": [ "5432" ]
```

### Adding another service

You can add other services to your `docker-compose.yml` file [as described in Docker's documentaiton](https://docs.docker.com/compose/compose-file/#service-configuration-reference). However, if you want anything running in this service to be available in the container on localhost, or want to forward the service locally, be sure to add this line to the service config:

```yaml
# Runs the service on the same network as the database container, allows "forwardPorts" in devcontainer.json function.
network_mode: service:db
```

### Using the forwardPorts property

By default, web frameworks and tools often only listen to localhost inside the container. As a result, we recommend using the `forwardPorts` property to make these ports available locally.

```json
"forwardPorts": [9000]
```

The `ports` property in `docker-compose.yml` [publishes](https://docs.docker.com/config/containers/container-networking/#published-ports) rather than forwards the port. This will not work in a cloud environment like Codespaces and applications need to listen to `*` or `0.0.0.0` for the application to be accessible externally. Fortunately the `forwardPorts` property does not have this limitation.


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/rsm-hcd/devcontainer-templates/blob/main/src/deno-postgres/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
