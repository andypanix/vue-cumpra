all: build up

build:
	docker-compose build

up:
	docker-compose down -v
	docker-compose up -d

firebase-login:
	docker-compose run --rm --entrypoint "bash -ic" vue "firebase login:ci --no-localhost"
	@echo "\nNow save the token to your .bashrc or .zshrc:\nexport FIREBASE_TOKEN=<YOUR-TOKEN>\nthen source it and run docker-compose up -d to inject the variable in the container."

firebase-add:
	docker-compose run --rm --entrypoint "bash -ic" vue "firebase use --add"

functions-deploy:
	docker-compose run --rm --entrypoint "bash -ic" vue "firebase deploy --only functions"