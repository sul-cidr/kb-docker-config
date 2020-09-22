FROM postgres:9.1

LABEL author="Simon Wiles <simon.wiles@stanford.edu>"
EXPOSE 5432/tcp

RUN apt-get update -qq && \
	apt-get install -y --force-yes --no-install-recommends postgresql-9.1-postgis-2.2 && \
	rm -rf /var/lib/apt/lists/*


COPY lib /opt/lib/
COPY kindred_db.final.pg_dump /opt/

COPY kindred_db.init.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/kindred_db.init.sh
