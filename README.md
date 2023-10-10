# Experiment

Scaling between cloud functions and dedicated servers.

## Why?

It's cheapest to start with cloud functions (fractional ownership). But once a steady load is acheived, it becomes cheaper to use dedicated servers instead (monthly committment).

For example, if the cheapest dedicated server is $7/month, once you reach $7 of usage with cloud functions, it's cheaper to switch over to dedicated.

Right now, you'd have to change hosts. Which is a painful migration. This experiment aims to prove a single hosting provider can easily swap between both options.

## How it works

When the code is deployed, the code is built for both scenarios. A Docker image is built for dedicated machines and a cloud function is deployed as well.

A load balancer is provisioned, and by default it directs traffic to the cloud function.

To switch from a cloud function to a dedicated machine, all that's needed to is to boot a new dedicated instance and update the load balancer to point to the dedicated instance group.

The same codebase `routes.js` is used for both scenarios. They are just wrapped differently, see wrappers `dedicated.js` and `function.js`.

## License

MIT
