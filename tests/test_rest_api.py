import pytest
import pytest_html
import json


def test_get_call():
       collected_f = open('data/api_data.json')
       collected_data = json.load(collected_f)
       
       expected_f = open('tests/data/expected_api_data.json')
       expected_data = json.load(expected_f)
       
       assert collected_data==expected_data