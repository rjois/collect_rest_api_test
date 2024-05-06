import requests
import json

class GetRequest:
  """
  A class for sending GET requests.
  """

  def __init__(self, url, req_para, req_head):
    """
    Initializes the class with the target URL.

    Args:
      url: The URL to send the GET request to.
      req_para: Parameters for the GET request
      req_head: Parameters for the GET request

    """
    self.url = url
    self.params = req_para
    self.headers = req_head

  def send(self):
    print(self.url, self.params,  self.headers)
    """
    Sends a GET request to the target URL with optional parameters.

    Args:
      None: 

    Returns:
      A requests.Response object containing the response from the server.
    """
    try:
      response = requests.get(self.url, params=self.params,  headers=self.headers)
      response.raise_for_status()  # Raise an exception for non-2xx status codes
      return response
    except requests.exceptions.RequestException as e:
      print(f"An error occurred: {e}")
      return None

# Main function to collect the data
if __name__ == "__main__":
  print('Data collection started')
  # Replace with the URL you want to fetch
  headers = {"content-type": "application/json"}
  requestUrl = "https://api.restful-api.dev/objects?id=3&id=5&id=10"
  getter = GetRequest(requestUrl, None, headers)
  response = getter.send()

  if response:
    # Check the status code
    print(f"Status code: {response.status_code}")

    # Access the response content (can be text, json, etc.)
    req_response = response.content.decode("utf-8")
    
    with open('data/api_data.json', 'w') as f:
      json.dump(req_response, f)
    print('Data file saved successfuly\n')