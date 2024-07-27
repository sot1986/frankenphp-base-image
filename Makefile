PHP_VERSION=8.3
FRANKENPHP_VERSION=latest
COMPOSER_VERSION=latest
NODE_VERSION=20-alpine

build:
	@echo "Building..."
	docker build -t laravel-franken-php .

auth:
	@echo "Authenticating with AWS ECR..."
	aws ecr get-login-password --region eu-south-1 | docker login --username AWS --password-stdin 208722357485.dkr.ecr.eu-south-1.amazonaws.com

build-push:
	@echo "Building..."
	docker build -t prod-laravel-frankenphp-base-image .
	@echo "Tagging..."
	docker tag prod-laravel-frankenphp-base-image:latest 208722357485.dkr.ecr.eu-south-1.amazonaws.com/prod-laravel-frankenphp-base-image:latest
	@echo "Pushing..."
	docker push 208722357485.dkr.ecr.eu-south-1.amazonaws.com/prod-laravel-frankenphp-base-image:latest