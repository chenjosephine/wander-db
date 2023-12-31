# wander-db

This repo houses changes to the wander db.

## LOCAL ENVIRONMENT

On startup,

1. clone repo
2. run `docker build . -t wander-db`
3. run `docker-compose up`

### UPDATES TO THE REPO

Updates require a rebuild of the docker image and restart of the container:

1.

```
docker-compose down
```

2.

```
docker build . -t wander-postgres-db
```

3. run

```
docker-compose up
```

### BUILD SCRIPTS FOR LOCAL TESTING AND SCRIPT VALIDATION

1. Build the image using the following command:

```
docker build --build-arg DBNAME={{DBNAME}} --build-arg DBUSER={{DBUSER}} --build-arg DBPASS={{DBPASS}} . -t wander-postgres-db
```

2. Start up the container using the newly built image:

```
docker run -d -p 5433:5432 --name wander-db wander-postgres-db
```

3. Check that the scripts have successfully executed using the following command:

```
docker logs wander-db
```

### PIPELINES

- Any pull request will trigger testing of the db in the pipeline
- When pull requests are closed, the db is published to dockerhub
