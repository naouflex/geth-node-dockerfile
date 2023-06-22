# Use a base image with the desired Linux distribution and Golang installed
FROM golang:1.15.2-buster

RUN apt-get install -y curl python3 
RUN apt-get update && apt-get -y install golang-go 


# Install Geth dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

# Set the entrypoint command to launch Geth with the specified options
ENTRYPOINT ["./build/bin/geth", "--syncmode", "light", "--http", "--http.port", "8545", "--http.addr", "0.0.0.0", "--http.corsdomain", "'*'", "--http.api", "eth,web3"]
