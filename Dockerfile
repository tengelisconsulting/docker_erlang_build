FROM erlang:22.2.2-alpine

WORKDIR /build

RUN apk --update --no-cache add \
        git \
        curl \
        build-base

RUN set -xe \
        && curl -fSL -o rebar3 "https://s3.amazonaws.com/rebar3-nightly/rebar3" \
        && chmod +x ./rebar3 \
        && ./rebar3 local install \
        && rm ./rebar3

ENV PATH "$PATH:/root/.cache/rebar3/bin"

ENTRYPOINT [ "rebar3", "--version" ]
