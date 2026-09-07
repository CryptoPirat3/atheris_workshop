FROM python:3.11-slim

ENV SRC=/src
ENV OUT=/out

WORKDIR $OUT
WORKDIR $SRC

RUN apt-get update && apt-get install -y \
    git

RUN git clone https://github.com/python-hyper/rfc3986 && \
    python3 -m pip install atheris && \
    pip3 install rfc3986/

COPY urlparse.patch clean_corpus.sh $SRC/
COPY assets $SRC/assets

CMD ["/bin/bash"]

