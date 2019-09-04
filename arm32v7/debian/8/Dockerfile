FROM arm32v7/debian:jessie-slim
ENV \
  LANG="C.UTF-8" \
  LANGUAGE="C.UTF-8" \
  LC_ALL="C.UTF-8" \
  LC_CTYPE="C.UTF-8"

# bash and curl needed by the steps on Wercker CI
RUN apt-get -q update && apt-get -q upgrade && apt-get install --no-install-recommends -y -q \
  curl \
  g++ \
  git \
  make \
  && rm -rf /var/lib/apt/lists/* \
  ;

ARG \
  ROCKSDB="--branch=feature/arm32v7 https://github.com/michilu/rocksdb.git"
WORKDIR /root/work
CMD \
  git clone --depth=1 $ROCKSDB . \
  && make shared_lib \
  ;
