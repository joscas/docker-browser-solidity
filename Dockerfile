FROM node
MAINTAINER "Josep Casals <joscas@gmail.com>"

# Install dependency packages
RUN apt-get update && \
    apt-get install -y git-core

# Install browser-solidity
RUN mkdir -p /usr/src/browser-solidity
WORKDIR /usr/src/browser-solidity
RUN git clone https://github.com/ethereum/browser-solidity.git .
RUN npm install && \
    npm run build

EXPOSE 8080
CMD ["npm","run","serve"]
