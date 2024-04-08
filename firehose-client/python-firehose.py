import json
import boto3

# create session using aws profile name. Change `default` to your profile name
session = boto3.Session(profile_name='default')
temperatureClient = session.client('firehose')
firehose_data_stream = 'PUT-SNW-eE5Nx'  # change this


with open("smaller_events.json") as json_file:
    observations = json.load(json_file)
    for observation in observations:
        input(">press any key to send event")
        response = temperatureClient.put_record(
           DeliveryStreamName=firehose_data_stream,
           Record={
                'Data': json.dumps(observation)
            }
        )
        if response['ResponseMetadata']['HTTPStatusCode'] == 200:
            print(f"send {observation}")
        else:
            print(f"failed to send data")
            print(response)

