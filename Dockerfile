ARG PG_MAJOR=15
FROM postgres:$PG_MAJOR

RUN apt update
RUN apt install -y --no-install-recommends build-essential git make ca-certificates postgresql-server-dev-$PG_MAJOR
WORKDIR /tmp

# pgvector
RUN git clone --branch v0.4.1 https://github.com/pgvector/pgvector.git
WORKDIR /tmp/pgvector
RUN make
RUN make install