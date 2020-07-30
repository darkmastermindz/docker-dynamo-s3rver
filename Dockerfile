FROM node:13-alpine

RUN apk add --no-cache rsync

RUN mkdir /app
RUN mkdir /dynamodb
RUN mkdir /s3rver
RUN mkdir /buckets

WORKDIR /app

# Download and unzip latest dynamodb local from AWS
ADD https://s3.us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz /dynamodb

# Download and unzip latest s3rver from github
ADD https://github.com/jamhall/s3rver/archive/master.zip /s3rver

COPY package.json

RUN npm install

EXPOSE 4568
EXPOSE 8000

# Required for S3RVER 3.6.1
RUN export AWS_ACCESS_KEY_ID=S3RVER
RUN export AWS_SECRET_ACCESS_KEY=S3RVER

COPY s3rver_startup.sh /app/s3rver_startup.sh
COPY dynamodb_startup.sh /app/dynamo_startup.sh

RUN 
