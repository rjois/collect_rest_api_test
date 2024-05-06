FROM python:3.11.3-slim

RUN apt-get update
    
# Copy the source code to the work directory
COPY . /usr/local/src/product_test
WORKDIR /usr/local/src/product_test
RUN touch /usr/local/src/product_test/log/runtime_log.log

# Install the dependencies via pip.
RUN pip3 install -r requirements.txt

ENTRYPOINT /usr/local/src/product_test/collect_test.sh
