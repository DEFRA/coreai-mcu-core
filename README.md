# coreai-mcu-core

## Prerequisites
* Docker
* Docker Compose
* WSL2 (Windows only)

## Services
| Service |
|---------|
[coreai-mcu-documents](https://github.com/DEFRA/coreai-mcu-documents)
[coreai-mcu-frontend](https://github.com/DEFRA/coreai-mcu-frontend)
[coreai-mcu-generation-oai](https://github.com/DEFRA/coreai-mcu-generation-oai)
[coreai-mcu-knowledge-pgv](https://github.com/DEFRA/coreai-mcu-knowledge-pgv)
[coreai-mcu-responses](https://github.com/DEFRA/coreai-mcu-responses)

## Setting up the project
```bash
git clone https://github.com/DEFRA/coreai-mcu-core --recurse-submodules
```

## Updating submodules
```bash
git submodule update --remote
```

## Setting environment variables
Create a `.env` file based on the `.env.example` file. The `.env` file should be placed in the root of the project.

Run the following command to export the environment variables:
```bash
source .env
```

## Running the services
To start the coreai-mcu services execute the following:
```bash
./scripts/start
```
