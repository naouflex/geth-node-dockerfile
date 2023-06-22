# Use a base image with the desired Linux distribution and Golang installed
FROM golang:latest

# Install Geth dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install software-properties-common -y && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

# Set the entrypoint command to launch Geth with the specified options
ENTRYPOINT ["./build/bin/geth", "--syncmode", "light", "--http", "--http.port", "8545", "--http.addr", "0.0.0.0", "--http.corsdomain", "'*'", "--http.api", "eth,web3"]
