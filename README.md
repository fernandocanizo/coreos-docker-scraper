# docker-django-example

This project is a base for developing a Django application with Docker. It consists of the following services and containers:

Service    | Container  | Port | URL
---------- | ---------- | ---- | ------------------------------------------
Gunicorn   | `django`   | 8000 | [http://localhost:8000](http://localhost:8000)
Nginx      | `nginx`    | 8080 | [http://localhost:8080](http://localhost:8080)
PostgreSQL | `postgres` | 5432 | `psql -h localhost`
Redis      | `redis`    | 6379 | `redis-cli -h localhost`

## Dependencies

In addition to using Docker, the intended Docker host operating system is [CoreOS](https://coreos.com/). In order to work with CoreOS locally, we use a CoreOS Vagrant box, so you'll need to [download and install Vagrant](https://www.vagrantup.com/downloads.html).

Lastly, you'll need [`docker-compose`](https://docs.docker.com/compose/), which is a tool for defining and running multi-container applications with Docker. 

```bash
$ pip install docker-compose
```

## Usage

Bring up the CoreOS Docker host with:

```bash
$ vagrant up
```

After the machine is up, you must set `DOCKER_HOST` to the Vagrant host-only interface IP:

```bash
$ export DOCKER_HOST=tcp://172.17.8.100:2375
```

Next, we need to build any containers with an associated `Dockerfile` with `docker-compose`:

```bash
$ docker-compose build
```

Once that's complete, use `docker-compose` again to bring up the environment:

```bash
$ docker-compose up
```
