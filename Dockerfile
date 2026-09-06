FROM gcr.io/oss-fuzz-base/base-builder-python

ENV SRC=/src
ENV OUT=/out

WORKDIR $OUT
WORKDIR $SRC

RUN apt-get update && apt-get install -y \
    nano

RUN git clone https://github.com/python-hyper/rfc3986
COPY build.sh urlparse.patch clean_corpus.sh $SRC/
COPY assets $SRC/assets

CMD ["/bin/bash"]

