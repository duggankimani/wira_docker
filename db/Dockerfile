FROM postgres:9.4
MAINTAINER duggankimani
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB workflow
ADD ./scripts/*.sql /docker-entrypoint-initdb.d/
