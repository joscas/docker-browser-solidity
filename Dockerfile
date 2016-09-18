FROM node
MAINTAINER "Josep Casals <joscas@gmail.com>"

# Install dependency packages
RUN apt-get update && \
    apt-get install -y git-core

# Install browser-solidity
RUN mkdir -p /usr/src/browser-solidity
WORKDIR /usr/src/browser-solidity

RUN git clone https://github.com/ethereum/browser-solidity.git . &&\
    git reset --hard ab0593386a761e9755e3c79968767ffa8ad2fd82
RUN npm install && \
    npm run build

EXPOSE 8080
CMD ["npm","run","serve"]
