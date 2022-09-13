import boto3
from boto3.dynamodb.conditions import Key, Attr

# dynamodb = boto3.resource('dynamodb')
# table = dynamodb.Table('qa-th.customer-list.eapi.lotus')
### get data from dynamodb ###
# response = table.get_item(
#     Key={
#         'phone_number': 909011234
#     }
# )
# get_item = response['Item']
# print(get_item)

table_name = "qa-th.customer-list.eapi.lotus"
primary_column_name = 'phone_number'
primary_key = 1236547890
columns = ["id", "person_contact_id"]
client = boto3.client('dynamodb')
db = boto3.resource('dynamodb')
table = db.Table(table_name)

#create item to
table.put_item(
   Item={
        'phone_number': 1236547890,
        'id': 'aaaaaabbbbbb',
        'person_contact_id':'bbbbbbaaaaaa'
    }
)
print('create complete')

# get data item
response = table.get_item(
    Key={
        primary_column_name: primary_key
    }
)
item = response['Item']
print('get data item')
print(item)

#query all item
response = table.query(
    KeyConditionExpression=Key('phone_number').eq(1236547890)
)
items = response['Items']
print('query all item')
print(items)

#scan item
response = table.scan(
    FilterExpression=Attr('id').lt('test_id')
)
items = response['Items']
print('scan item')
print(items)

#deleted item
data = table.delete_item(
    Key={
        'phone_number':1236547890,
    }
)
print('Deleted')


### get dynamodb function ###
# def get_all_data():
#     dynamodb = boto3.resource('dynamodb')
#     table = dynamodb.Table('qa-th.customer-list.eapi.lotus')
#     response = table.get_item(
#         Key={
#             'phone_number': 909011234
#         }
#     )
#     get_item = response['Item']
#     print(get_item)
#     return get_item
