# coreai-mcu-core

## Prerequisites
* Docker
* Docker Compose
* WSL2 (Windows only)

## Setting up the project
```bash
git clone https://github.com/DEFRA/coreai-mcu-core --recurse-submodules
git submodule update --remote
git pull --recurse-submodules
```

## Updating submodules
```bash
git submodule update --remote
git pull --recurse-submodules
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
