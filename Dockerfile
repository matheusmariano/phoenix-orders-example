FROM elixir:1.9-alpine

WORKDIR /usr/src/app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new 1.4.11 --force

ADD . ./

RUN mix do deps.get, compile, release

EXPOSE 4000

CMD [ "mix", "phx.server" ]
