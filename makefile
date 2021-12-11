setup: env build up install

setup-dev: env build up install-dev

env:
	cp .env.example .env

build:
	docker-compose build --no-cache

up:
	docker-compose up -d

down:
	docker-compose down

dev-copy: clean-tastyigniter
	cp -r ~/git/tastyigniter core/tastyigniter

install: clean-tastyigniter
	docker-compose exec ti-docker-testing-app ./install.sh

install-dev: dev-copy
	docker-compose exec ti-docker-testing-app ./install_dev.sh

shell:
	docker-compose exec ti-docker-testing-app sh

clean-env:
	rm .env

clean-tastyigniter:
	rm -rf core/tastyigniter

clean-docker-image:
	docker rmi ti-docker-testing_ti-docker-testing-app

clean-docker-volume:
	docker volume rm ti-docker-testing-database-store

clean: down clean-env clean-tastyigniter clean-docker-image clean-docker-volume

