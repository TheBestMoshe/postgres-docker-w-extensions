ARG PG_MAJOR=15
ARG PG_VECTOR=v0.4.1
FROM postgres:$PG_MAJOR

RUN apt update
RUN apt install -y --no-install-recommends build-essential git make ca-certificates postgresql-server-dev-$PG_MAJOR
WORKDIR /tmp

# pgvector
RUN git clone --branch $PG_VECTOR https://github.com/pgvector/pgvector.git
WORKDIR /tmp/pgvector
RUN make
RUN make install