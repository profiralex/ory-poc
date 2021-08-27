args=$(filter-out $@,$(MAKECMDGOALS))

up-db:
	docker-compose -f docker-compose-db.yml up -d

up-kratos:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml up -d

up-hydra:
	docker-compose -f docker-compose-db.yml -f docker-compose-hydra.yml up -d

up: up-db up-kratos up-hydra

stop:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml stop $(args)

restart: stop up

logs:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml logs -f $(args)

exec:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml exec $(args)

down:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml down -v

