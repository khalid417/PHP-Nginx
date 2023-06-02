# PHP-Nginx
 Docker Backend Services

## Build Instructions
If you have docker extensions for VSCode, then run `up` on `docker-compose.yml`. If not, run `docker build` on each component in `docker-compose.yml`, namely `php/Dockerfile`, `nginx/Dockerfile`, and `postgres/Dockerfile` before running `up`. For production build, use the `docker-compose-prod.yml` file instead. Files in `data` and `logs` are mounted to the `php` and `nginx` containers in non-production builds. `pgdata` is mounted to the `postgres` container. When running the `postgres` container, the initialization scripts are only run if that `pgdata` does not have initialization data in it; to test initialization scripts, remove the contents of the `pgdata` folder.