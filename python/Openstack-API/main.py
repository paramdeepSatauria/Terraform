import requests
import json
import os
from dotenv import load_dotenv
load_dotenv(override = True)
controller_ip = os.getenv('CONTROLLER_IP')
auth_url = os.getenv('AUTH_URL')

def writeFileAppend(name, data):
  file = open(name, 'a')
  file.write(data)
  file.close()

def getAccessToken():
  # defining the api-endpoint
  api_get_authtoken = auth_url + '/auth/tokens?nocatalog'
  # data to be sent to api
  request_data = '{ "auth": { "identity": { "methods": ["password"], "password": { "user": { "domain": { "name": "'+ os.getenv("USER_DOMAIN_NAME") +'" }, "name": "'+ os.getenv("USERNAME") +'", "password": "'+ os.getenv("PASSWORD") +'" } } }, "scope": { "project": { "domain": { "name": "'+ os.getenv("PROJECT_DOMAIN_NAME") +'" }, "name": "'+ os.getenv("PROJECT_NAME") +'" } } } }'
  # sending post request and saving response as response object
  response = requests.post(url=api_get_authtoken, data=request_data)
  # extracting response text
  response_header = dict(response.headers)
  response_text = json.loads(response.text)
  print(response_header["X-Subject-Token"])
  print(response_text["token"]["expires_at"])
  writeFileAppend('demo.txt', '\n' + str(response.headers))
  writeFileAppend('demo.txt', '\n' + response.text)
  return response_header["X-Subject-Token"]

def getEndpoint(accessToken):
  api_get_endpoint = auth_url + '/endpoints'
  headers = {'X-Auth-Token': accessToken}
  response = requests.get(url=api_get_endpoint, headers=headers)
  response_header = json.loads(response.text)
  return response_header

def updateEndpoint(accessToken, endpoint_id, data):
  api_update_endpoint = auth_url + '/endpoints/' + endpoint_id
  headers = {'Content-Type': 'application/json', 'X-Auth-Token': accessToken}
  print(data)
  print(api_update_endpoint)
  # Making a PATCH request
  response = requests.patch(url=api_update_endpoint, json=data, headers=headers)
  # success code - 200
  print(response.headers) 
  # print content of request
  print(response.content)
  print(response.status_code)


if __name__ == '__main__':
  accessToken = getAccessToken()
  endpoints = getEndpoint(accessToken)
  print(len(endpoints["endpoints"]))
  count = 0
  for endpoint in endpoints["endpoints"]:
    if endpoint["url"].find("controller") >= 0:
      count += 1
      data = {"endpoint": {"url": endpoint["url"].replace("controller", controller_ip)}}
      updateEndpoint(accessToken, endpoint["id"], data)
  print(count)