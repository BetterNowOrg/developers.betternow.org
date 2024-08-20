You can run this locally with `docker compose up`

If you have a `~/.puma-dev/bndocs` file that has the port from the docker
compose file you can see it at `http://bndocs.test`, otherwise it should be at
`http://localhost:4567`

You can run the build inside the container (if it is running) with `docker
compose exec web bin/build`

Pushing to github's master will deploy the site to
`https://developers.betternow.org`
