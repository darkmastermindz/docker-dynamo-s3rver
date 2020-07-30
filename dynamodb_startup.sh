#!/bin/sh

# From AWS Documentation
# https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html

java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
aws dynamodb list-tables --endpoint-url http://localhost:8000
