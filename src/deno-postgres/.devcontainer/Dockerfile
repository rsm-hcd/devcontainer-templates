FROM denoland/deno:bin-${templateOption:denoVersion} AS deno
FROM mcr.microsoft.com/devcontainers/typescript-node:20
COPY --from=deno /deno /usr/local/bin/deno
