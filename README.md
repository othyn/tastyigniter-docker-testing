# Tasty Igniter - Docker Testing

A simple and easy Docker testing environment for [TastyIgniter](https://github.com/tastyigniter/TastyIgniter).

## Setup

Ensure that you are happy with any defaults in `.env.example`, then simply run:

```sh
make setup
```

This will;

- Create a working copy of `.env.example` to `.env`
- Build a set of images for the repo via Docker Compose
- Bring up the detached containers
- Run the TastyIgniter CLI installation wizard
  - Unfortunately it **does not** have a non-interactive mode otherwise I'd automated this as part of the container build step
    - I need to submit a PR against [TastyIgniter](https://github.com/tastyigniter/TastyIgniter) for this!
    - This should be an easy addition
  - Choose 'yes' to generate the app key in prod, its a limitation of TastyIgniter's fixed env
  - During installation remember to set the database host to the container name, which by default is `ti-docker-testing-database`
  - Provide the information as requested, passing in `.env` variables set. I usually just mash enter
    - ...with the only exception being adding `tasty` (or whatever you set the `.env` variables to) when passing in the database, username and password
    - ...also make sure not to skip over adding yourself to admin groups, otherwise you're locked out of everything!
  - Then head to [http://localhost/admin/login](http://localhost/admin/login) to get started!

### Setup for a local development version of TastyIgniter

If you're working from a local git development version of TastyIgniter in `~/git/tastyigniter`, that can be used as a source for this repo.

Use the command;

```sh
make setup-dev
```

To do pretty much what the `make setup` command does, but sourcing the TastyIgniter source code from the local cloned git version of TastyIgniter in `~/git/tastyigniter`, which is really handy for testing of TastyIgniter.

### Why port 80 by default?

In your `.env`, `WEB_EXT_PORT` is set to `80` by default. I've found that FireFox _does not_ like running from `8080` (or any non-standard port) for relative links, which breaks _all_ of the links that TastyIgniter makes use of for buttons and asset paths, so it completely breaks if its not over port `80`. Helpful.

## Development

To quickly bring up or down containers you can use exposed `make` commands, if you don't have shell aliases already setup:

```sh
make up

make down
```

To access a shell within the app container, you can use:

```sh
make shell
```

To clean out the repo and built fragments, you can use:

```sh
make clean
```
