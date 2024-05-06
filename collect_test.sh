#!/bin/bash

echo -e '\n Unit test case \n' >> /usr/local/src/product_test/log/runtime_log.log

cd /usr/local/src/product_test/tests/
python -u unittest_collect_data_rest.py >> /usr/local/src/product_test/log/runtime_log.log

echo -e '\n Data Collection \n' >> /usr/local/src/product_test/log/runtime_log.log

cd /usr/local/src/product_test/
python -u src/collect_data_rest.py >> /usr/local/src/product_test/log/runtime_log.log

echo -e '\n REST API tests \n' >> /usr/local/src/product_test/log/runtime_log.log

cd /usr/local/src/product_test/
pytest tests/test_rest_api.py --html=report.html >> /usr/local/src/product_test/log/runtime_log.log

cat /usr/local/src/product_test/log/runtime_log.log
