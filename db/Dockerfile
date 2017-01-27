FROM postgres:9.4
MAINTAINER duggankimani
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB workflow
#ADD ./scripts/*.sql /docker-entrypoint-initdb.d/
ADD https://wira.workpoint.co.ke/downloads/scripts.tar.gz /docker-entrypoint-initdb.d/
RUN tar -zxvf /docker-entrypoint-initdb.d/scripts.tar.gz -C /docker-entrypoint-initdb.d/
RUN cp /docker-entrypoint-initdb.d/scripts/*.sql /docker-entrypoint-initdb.d/
