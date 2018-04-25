## Version

- Ruby 2.5.1 on alpine 3.7
- Install libraries for `gem install nokogiri`
  - see `Dockerfile`

## Init

**for build image**
`docker-compose build`

**for bundle install**
`docker-compose run --rm ruby-container`

## Usage

### basic

`docker-compose run --rm ruby-container ruby ./test/index.rb`

### after add gem

Edit `Gemfile`, then `docker-compose run --rm ruby-container`.

## about Volume

Dockerfile use a local volume driver.
Check `docker volue ls`, you see `hoge_bundle`
