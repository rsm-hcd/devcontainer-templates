# RSM Dev Container Templates

This repo is based on the [Dev Container Template Starter](https://github.com/devcontainers/template-starter) and the [Dev Container Template specification](https://containers.dev/implementors/templates-distribution/#distribution) and will be updated with templates that are applicable to the work we do as a team.

<table style="width: 100%; border-style: none;"><tr>
<td style="width: 140px; text-align: center;"><a href="https://github.com/devcontainers"><img width="128px" src="https://raw.githubusercontent.com/microsoft/fluentui-system-icons/78c9587b995299d5bfc007a0077773556ecb0994/assets/Cube/SVG/ic_fluent_cube_32_filled.svg" alt="devcontainers organization logo"/></a></td>
<td>
<strong>Development Container Templates</strong><br />
A simple set of dev container 'templates' to help get you up and running with a containerized environment.
</td>
</tr></table>

A **development container** is a running [Docker](https://www.docker.com) container with a well-defined tool/runtime stack and its prerequisites. It allows you to use a container as a full-featured development environment which can be used to run an application, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing.

This repository contains a set of **Dev Container Templates** which are source files packaged together that encode configuration for a complete development environment. A Template can be used in a new or existing project, and a [supporting tool](https://containers.dev/supporting) will use the configuration from the template to build a development container.

## Contents

- [`src`](src) - A collection of subfolders, each declaring a template. Each subfolder contains at least a
    `devcontainer-template.json` and a [devcontainer.json](https://containers.dev/implementors/json_reference/).
- [`test`](test) - Mirroring `src`, a folder-per-template with at least a `test.sh` script. These tests are executed by the [CI](https://github.com/rsm-hcd/devcontainer-templates/blob/main/.github/workflows/test-pr.yaml).

## Getting Started

Opening this repository in a [Dev Container](https://containers.dev/implementors/dev_container/) will allow you to run the tests and make changes to the templates. You can also use the [Dev Container CLI](https://containers.dev/implementors/cli/) to create a new project using one of these templates.

### Running Tests

The simplest way to run the tests is to open the repository within a Dev Contatiner inside VS Code: [Dev Containers extension for Visual Studio Code](https://code.visualstudio.com/docs/remote/devcontainer-overview).

For example, to run the tests for the `deno` template, you can open the repository in a Dev Container and then run:

```sh
npm run test deno
```

## Contributions

### Contributing to this repository

This repository will accept improvement and bug fix contributions related to the
[current set of maintained templates](./src).

## Feedback

Issues related to these templates can be reported in [an issue](https://github.com/rsm-hcd/devcontainer-templates/issues) in this repository.

## License

Copyright (c) Microsoft Corporation. All rights reserved. <br />
Licensed under the MIT License. See [LICENSE](LICENSE).
