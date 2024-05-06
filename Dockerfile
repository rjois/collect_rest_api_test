FROM python:3.11.3-slim

# Install cron, tzdata and git
RUN apt-get update && \
    apt-get -y install cron && \
    apt-get install git -y 


# Copy the source code to the work directory
COPY . /usr/local/src/product_test
WORKDIR /usr/local/src/product_test
RUN touch /usr/local/src/product_test/log/runtime_log.log

# Install the dependencies via pip.
RUN pip3 install -r requirements.txt

#WORKDIR /usr/local/src/product_test/tests
##CMD ["python", "-u", "unittest_collect_data_rest.py", ">> /var/log/runtime_log.log"] 
#RUN python -u unittest_collect_data_rest.py >> /usr/local/src/product_test/log/runtime_log.log

#WORKDIR /usr/local/src/product_test
##CMD ["python","-u", "src/collect_data_rest.py", ">> /var/log/runtime_log.log"]
#RUN python -u src/collect_data_rest.py >> /usr/local/src/product_test/log/runtime_log.log

##CMD [ "pytest", "tests/test_rest_api.py", ">>", "/usr/local/src/product_test/log/runtime_log.log"]
#RUN pytest tests/test_rest_api.py --html=report.html >> /usr/local/src/product_test/log/runtime_log.log

##CMD ["cat", "/var/log/runtime_log.log"]
#RUN tail -f /usr/local/src/product_test/log/runtime_log.log

ENTRYPOINT /usr/local/src/product_test/collect_test.sh
