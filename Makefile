args=$(filter-out $@,$(MAKECMDGOALS))

up:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml up -d

stop:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml stop

restart: stop up

logs:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml logs -f $(args)

exec:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml exec $(args)

down:
	docker-compose -f docker-compose-db.yml -f docker-compose-kratos.yml -f docker-compose-hydra.yml down -v

