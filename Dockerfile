FROM node:10
# don't use slim
MAINTAINER silverbirder <silverbirder@gmail.com>

WORKDIR /opt/node

COPY package.json package-lock.json index.js ./
RUN apt-get update \
    # For Canvas
    && apt-get install -y \
        build-essential \
        libcairo2-dev \
        libpango1.0-dev \
        libjpeg-dev \
        libgif-dev \
        librsvg2-dev \
    # For Puppeteer
    && apt-get install -y \
         gconf-service \
         libasound2 \
         libatk1.0-0 \
         libc6 \
         libcairo2 \
         libcups2 \
         libdbus-1-3 \
         libexpat1 \
         libfontconfig1 \
         libgcc1 \
         libgconf-2-4 \
         libgdk-pixbuf2.0-0 \
         libglib2.0-0 \
         libgtk-3-0 \
         libnspr4 \
         libpango-1.0-0 \
         libpangocairo-1.0-0 \
         libstdc++6 \
         libx11-6 \
         libx11-xcb1 \
         libxcb1 \
         libxcomposite1 \
         libxcursor1 \
         libxdamage1 \
         libxext6 \
         libxfixes3 \
         libxi6 \
         libxrandr2 \
         libxrender1 \
         libxss1 \
         libxtst6 \
         ca-certificates \
         fonts-liberation \
         libappindicator1 \
         libnss3 \
         lsb-release \
         xdg-utils \
         wget \
    # For Japanese Fonts
    && apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho \
    # For Dev
    && apt-get install -y vim \
    # For npm
    && npm install \
    && mkdir public

CMD ["node", "/opt/node/index.js"]