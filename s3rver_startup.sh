#!/bin/sh

aws --endpoint-url=http://localhost:8000 --region=us-east-1 s3 $@
