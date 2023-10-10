# Experiment

Scaling between cloud functions and dedicated servers.

## Why?

It's cheapest to start with cloud functions (fractional ownership). But once a steady load is acheived, it becomes cheaper to use dedicated servers (bigger committment, but lower TCO).

For example, if the cheapest dedicated server is $7/month, once $7 of cloud function usage is reached, it's cheaper to switch over to dedicated servers.

Right now, it would mean changing hosting providers, since most providers specialize in one style or the other.

This experiment aims to prove that a single hosting provider can support both options.

## How it works

When the code is deployed, it's built for both scenarios. A Docker image is built for dedicated machines and a cloud function is deployed as well.

A load balancer is provisioned, and by default it directs all traffic to the cloud function.

To switch from a cloud function to a dedicated machine, a new vm instance is booted and the load balancer is updated to point to the new instance. And vice versa, to switch back to cloud functions, the load balancers just needs to be updated to point to the cloud functions and the instances can then be terminated.

The same codebase [`routes.js`](/routes.js) is used for both scenarios. They are just wrapped differently. There are wrappers for [dedicated servers](/dedicated.js) and [cloud functions](/index.js).

## Scripts

- [`build`](/scripts/build.sh): Build a Docker image.
- [`run`](/scripts/run.sh): Run Docker container locally.
- [`stop`](/scripts/stop.sh): Stop locally running Docker container.
- [`deploy`](/scripts/deploy.sh): Deploy docker image and cloud function.
- [`switch-dedicated`](/scripts/switch-dedicated.sh): Switch to dedicated servers.
- [`switch-cloud-function`](/scripts/switch-cloud-function.sh): Switch to cloud functions.

## License

MIT
