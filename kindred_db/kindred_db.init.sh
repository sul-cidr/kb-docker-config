#!/bin/bash

if [[ -n $(su --login postgres --command "psql -d kindred -c '\q' 2>&1") ]];
then
  su --login postgres --command "createdb kindred";
  su --login postgres --command "createuser --superuser power";
  su --login postgres --command "createuser --superuser karlg";
  su --login postgres --command "createuser --superuser kb";
  su --login postgres --command "createuser --superuser webapp";

  cp /opt/lib/temporal/temporal.control /usr/share/postgresql/9.1/extension/;
  cp /opt/lib/temporal/temporal--0.7.1.sql /usr/share/postgresql/9.1/extension/;
  cp /opt/lib/temporal/temporal.so /usr/lib/postgresql/9.1/lib/;
  cp /opt/lib/pgrouting/librouting* /usr/lib/postgresql/9.1/lib/;

  su --login postgres --command "pg_restore --dbname kindred -Fc /opt/kindred_db.final.pg_dump" || true;
fi;
