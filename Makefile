default:
	@echo "builds a docker container from Dockerfile"
	@echo "Available commands:"
	@echo "lint"
	@echo "build"

lint:
	hadolint Dockerfile

build: lint
	@DOCKER_BUILDKIT=1 docker build -t brujack/terraform_ansible_packer:latest .
