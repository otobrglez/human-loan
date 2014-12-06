# human-loan

Proof-of-concept for peer-to-peer loans.

Demo ~> [www.humanloan.com](http://www.humanloan.com)

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

## Licence

[LGPL](https://www.gnu.org/licenses/lgpl.html)
