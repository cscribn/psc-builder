# psc-builder

## Prerequisites

### Install Docker Desktop

#### Mac

```zsh
brew install --cask docker || brew upgrade --cask docker
```

#### Windows

```pwsh
wsl --install; `
winget install -e --id Docker.DockerDesktop
```

## Usage

### Checkout repository and enter it

```zsh
git clone https://github.com/cscribn/psc-builder.git; \
cd psc-builder
```

### Build the Docker container

```zsh
docker-compose build psc-builder
```

Or if updates have been made to the OS or ... since your last use, you can do a fresh build.

```zsh
docker-compose build --no-cache --pull psc-builder
```

### Run the Docker container

```zsh
docker-compose run --rm psc-builder
```
