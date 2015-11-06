FROM postgres:9.4

RUN echo deb http://http.debian.net/debian wheezy-backports main >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-${POSTGRES_MAJOR}-postgis-${POSTGIS_MAJOR} \
    postgis && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
