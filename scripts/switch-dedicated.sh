#!/bin/bash
curl -X PATCH \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "content-type: application/json" \
  https://www.googleapis.com/compute/beta/projects/cloud-scaling-401422/regions/us-east1/backendServices/backend-service-serverless-function-2 \
  --data '{
  "backends": [
    {
      "balancingMode": "UTILIZATION",
      "capacityScaler": 1,
      "group": "projects/cloud-scaling-401422/zones/us-east1-b/instanceGroups/instance-group-1",
      "maxUtilization": 0.8
    }
  ],
  "enableCDN": false,
  "healthChecks": [
    "projects/cloud-scaling-401422/regions/us-east1/healthChecks/cloud-scaling-health-check-1"
  ],
  "localityLbPolicy": "ROUND_ROBIN",
  "protocol": "HTTP"
}'
