FROM alpine:3.16.3

# APK Update
RUN apk update

# ZSH
RUN apk add --no-cache \
    zsh \
    zsh-autosuggestions

# Dev Tools
RUN apk add --no-cache \
    cloc \
    curl \
    git \
    git-zsh-completion \
    openssh-client \
    vim

# Oh My ZSH
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

COPY ./root/ /root/

CMD [ "zsh" ]
