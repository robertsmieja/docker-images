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
    nodejs\
    npm

# Install PNPM
RUN npm install --global pnpm

# PNPM packages
RUN pnpm install --global \
    eslint \
    jest \
    lerna \
    np \
    npm-check-updates \
    pnpm \
    prettier \
    ts-node \
    typescript
