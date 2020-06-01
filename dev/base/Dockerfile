FROM alpine:3.12

# APK Update
RUN apk update

# ZSH
RUN apk add --no-cache \
    zsh=5.8-r1 \
    zsh-autosuggestions=0.6.4-r0

# Dev Tools
RUN apk add --no-cache \
    curl=7.69.1-r0 \
    git=2.26.2-r0 \
    git-zsh-completion=5.8-r1

# Oh My ZSH
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
