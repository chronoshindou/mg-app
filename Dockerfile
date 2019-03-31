FROM node:9-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# --virtual: bundle packages, remove whole bundle at once, when done
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install \
	&& npm install -g @angular/cli ionic \
    && apk del build-dependencies

EXPOSE 8100
#CMD [ "npm", "start" ]