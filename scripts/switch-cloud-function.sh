#!/bin/bash
curl -X PATCH \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "content-type: application/json" \
  https://www.googleapis.com/compute/beta/projects/cloud-scaling-401422/regions/us-east1/backendServices/backend-service-serverless-function-2 \
  --data '{
  "backends": [
    {
      "balancingMode": "UTILIZATION",
      "group": "projects/cloud-scaling-401422/regions/us-east1/networkEndpointGroups/serverless-network-endpoint-group-3"
    }
  ],
  "enableCDN": false,
  "fingerprint": "hATqv80S4Ak=",
  "healthChecks": [],
  "portName": null,
  "protocol": "HTTPS"
}'
