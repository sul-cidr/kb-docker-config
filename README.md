# kb-docker-config

This repo contains a docker configuration that can be used to deploy the Kindred Britain (v1) project from https://github.com/sul-cidr/kb-v1.  The public site is available at https://kindred.stanford.edu.

The configuration runs containers for the Kindred Britain php app and a PostgreSQL server with several custom extensions.  It also runs an NGINX container which is exposed to the docker host on tcp/8080 (with the expectation that this will sit behind a web-server running directly on the host itself).

I've tried to touch the orignal repo (at `sul-cidr/kb-v1`), and in particular the code, as little as possible.  The main thing is that the codebase was hardcoded to connect to a database server at `orbis-prod.stanford.edu` which is no longer available, so I've set it to read parameters from the environment and default to connecting to localhost (see https://github.com/sul-cidr/kb-v1/blob/main/conn.php).

To get this up and going, make sure you have docker engine and docker-compose installed, then clone the repo and run `docker-compose up -d`.

Because the source from `sul-cidr/kb-v1` is built into a layer in the docker image, the `kindred_app` image would need to be deleted and rebuilt in order to redeploy with updated source from the `sul-cidr/kb-v1` repo.
