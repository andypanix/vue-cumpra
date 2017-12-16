FROM node:9.2.0-slim
MAINTAINER edoardo.dusi@gmail.com

ENV PORT 8080
ENV HOST 0.0.0.0
ENV NODE_ENV development
ENV YARN_CACHE_FOLDER /cache

# Build functions
COPY functions/package.json /functions/
RUN cd /functions && yarn install

# Install our dependencies
RUN yarn global add firebase-tools \
    && npm cache clean --force

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /app

EXPOSE 8080
