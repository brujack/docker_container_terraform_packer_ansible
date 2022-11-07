default:
	@echo "builds a docker container from Dockerfile"
	@echo "Available commands:"
	@echo "lint"
	@echo "build"
	@echo "scan"
	@echo "all"

lint:
	hadolint Dockerfile

scan:
	docker scan --file Dockerfile --accept-license brujack/terraform_ansible_packer:latest

build:
	@DOCKER_BUILDKIT=1 docker build -t brujack/terraform_ansible_packer:latest .

all: lint build scan
