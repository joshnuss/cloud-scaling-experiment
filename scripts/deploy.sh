#!/bin/bash

REGION=$(gcloud config get-value compute/region)
PROJECT=$(gcloud config get-value project)

echo "deploying $PROJECT in $REGION"

# push Docker image
docker tag dedicated-web $REGION-docker.pkg.dev/$PROJECT/quickstart-docker-repo/dedicated-web:latest
docker push $REGION-docker.pkg.dev/$PROJECT/quickstart-docker-repo/dedicated-web

# deploy cloud function
gcloud functions deploy \
  --gen2 \
  --region=$REGION \
  --runtime=nodejs20 \
  --trigger-http \
  --allow-unauthenticated \
  --entry-point=main \
  function-test

# allow function to be called by anyone
gcloud functions add-invoker-policy-binding \
  function-test \
  --region=$REGION \
  --member="allUsers"
