FROM python:3.11.3-slim

# Install cron and git
RUN apt-get update && \
    apt-get -y install cron && \
    apt-get install git -y 


# Copy the source code to the work directory
COPY . /usr/local/src/product_test
WORKDIR /usr/local/src/product_test
RUN touch /usr/local/src/product_test/log/runtime_log.log

# Install the dependencies via pip.
RUN pip3 install -r requirements.txt

ENTRYPOINT /usr/local/src/product_test/collect_test.sh
