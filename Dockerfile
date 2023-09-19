FROM postgres

ARG DBNAME
ARG DBPASS
ARG DBUSER

ENV POSTGRES_DB=$DBNAME
ENV POSTGRES_PASSWORD=$DBPASS
ENV POSTGRES_USER=$DBUSER

COPY ./postgres/ /docker-entrypoint-initdb.d/
EXPOSE 5432