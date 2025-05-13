# index.py
import json


def lambda_handler(event, context):
    # Example Lambda function code
    response = {
        "statusCode": 200,
        "body": json.dumps("Hello from Lambda!")
    }
    return response
