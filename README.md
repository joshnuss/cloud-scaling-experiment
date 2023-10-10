# Experiment

Scaling between cloud functions and dedicated servers.

## Why?

It's cheapest to start with cloud functions (fractional ownership). But once a steady load is acheived, it becomes cheaper to use dedicated servers (monthly committment).

For example, if the cheapest dedicated server is $7/month, once $7 of usage is reached with cloud functions, it's cheaper to switch over to dedicated servers.

Right now, it would mean changing hosts, since most specialize in one style or the other. It's a painful migration.

This experiment aims to prove a single hosting provider can easily swap between both options.

## How it works

When the code is deployed, the code is built for both scenarios. A Docker image is built for dedicated machines and a cloud function is deployed as well.

A load balancer is provisioned, and by default it directs traffic to the cloud function.

To switch from a cloud function to a dedicated machine, all that's needed to is to boot a new dedicated instance and update the load balancer to point to the dedicated instance group.

The same codebase [`routes.js`](/routes.js) is used for both scenarios. They are just wrapped differently, see wrappers for [dedicated servers](/dedicated.js) and [cloud functions](/index.js).

## Scripts

- [`build`](/scripts/build.sh): Build a Docker image.
- [`run`](/scripts/run.sh): Run Docker container locally.
- [`stop`](/scripts/stop.sh): Stop locally running Docker container.
- [`deploy`](/scripts/deploy.sh): Deploy docker image and cloud function.
- [`switch-dedicated`](/scripts/switch-to-dedicated.sh): Switch to dedicated servers.
- [`switch-cloud-function`](/scripts/switch-cloud-function.sh): Switch to cloud functions.

## License

MIT
