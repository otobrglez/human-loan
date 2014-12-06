# human-loan

Proof-of-concept for peer-to-peer loans.

- [Oto Brglez](https://github.com/otobrglez)

## Database

    initdb \
      -D db/pg-data \
      -E utf8 \
      --locale=en_US.UTF-8 \
      -U postgres \
      -A trust

    psql -U postgres

## Development

    rake db:setup; rake db:migrate
    foreman start

## Proxy notes

    curl -v -x http://torrero-main:3113 -s http://www.telize.com/ip

    aria2c --http-proxy=http://torrero-main:3113 http://www.telize.com/ip


