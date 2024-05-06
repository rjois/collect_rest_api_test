import requests
import unittest
from unittest.mock import patch
import sys
sys.path.append('..')
from src.collect_data_rest import GetRequest

class TestGetRequest(unittest.TestCase):

  @patch('requests.get')
  def test_send_success(self, mock_get):
    """
    Tests the send method with a successful response.
    """
    target_url = "https://api.restful-api.dev/objects?id=3&id=5&id=10"
    headers = {"content-type": "application/json"}
    mock_response = requests.Response()
    mock_response.status_code = 200
    mock_response._content = b"This is mock data to ckeck if everything else is working"
    mock_get.return_value = mock_response

    getter = GetRequest(target_url, None, headers)
    response = getter.send()

    self.assertEqual(response.status_code, 200)
    self.assertEqual(response.content, b"This is mock data to ckeck if everything else is working")

  @patch('requests.get')
  def test_send_error(self, mock_get):
    """
    Tests the send method with an error.
    """
    target_url = "https://api.restful-api.dev/objects?id=3&id=5&id=10"
    headers = {"content-type": "application/json"}
    mock_get.side_effect = requests.exceptions.RequestException("Mocked error")

    getter = GetRequest(target_url, None, headers)
    response = getter.send()

    self.assertIsNone(response)

if __name__ == "__main__":
  unittest.main()