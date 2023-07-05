# PHP-Nginx
 Docker Backend Services

## Build Instructions
If you have docker extensions for VSCode, then run `up` on `docker-compose.yml`. If not, run `docker build` on each component in `docker-compose.yml`, namely `php/Dockerfile`, `nginx/Dockerfile`, and `postgres/Dockerfile` before running `up`. For production build, use the `docker-compose-prod.yml` file instead. Files in `data` and `logs` are mounted to the `php` and `nginx` containers in non-production builds. `pgdata` is mounted to the `postgres` container. When running the `postgres` container, the initialization scripts are only run if that `pgdata` does not have initialization data in it; to test initialization scripts, remove the contents of the `pgdata` folder.

## Database Testing
To test the Postgresql database without the nginx reverse proxy, remove it from the internal network and enable the `adminer` container. Then go to the adminer service at port 8081.

## Unity Dependencies
One of the images require artifacts from the Unity to build. Because the context needs to know the relative path of where the files are, have a top level directory contain two folders: `Unity`, which will contain the unity git repo (i.e. named `Lorcana`) and `Docker` which will contain this repo (i.e. named `PHP-Nginx`). See the build instructions for Unity in the Unity repository. You **must** have the artifacts in the path `Unity/Lorcana/Build/Linux` or else the dockfile will not know where to copy the artifacts.