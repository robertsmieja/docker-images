# hadolint ignore=DL3007
FROM robertsmieja/dev-base:latest

# For puppeteer
# RUN apk add --no-cache \
#     ffmpeg \
#     chromium \
#     ttf-freefont \
#     ca-certificates

# For node-gyp
# RUN apk add --no-cache --virtual build-dependencies \
#    python \
#    build-base

# Node
RUN apk add --no-cache \
    nodejs=12.17.0-r0 \
    npm=12.17.0-r0

# NPM packages
RUN npm install --global \
    eslint@7.2.0 \
    jest@26.0.1 \
    lerna@3.22.0 \
    np@6.2.4 \
    npm@6.14.5 \
    npm-check-updates@6.0.1 \
    prettier@2.0.5 \
    ts-node@8.10.2 \
    typescript@3.9.5
