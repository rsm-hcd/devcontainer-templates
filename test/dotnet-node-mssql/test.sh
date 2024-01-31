#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c

# Remote - Containers does not auto-sync UID/GID for Docker Compose,
# so make sure test project prvs match the non-root user in the container.
fixTestProjectFolderPrivs

# Image specific tests
check "dotnet" dotnet --info
check "nuget" dotnet restore
check "msbuild" dotnet msbuild
rm -rf obj bin
check "nvm-node" node --version

# Report result
reportResults
