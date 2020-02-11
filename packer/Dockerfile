FROM hashicorp/packer:1.5.1

ARG PROXY=""
ENV http_proxy="${PROXY}"
ENV https_proxy="${PROXY}"

ARG USER=packer
ARG GROUP=packer

WORKDIR /packer

RUN apk add --update qemu qemu-system-x86_64 qemu-img \
        vim htop util-linux gzip sysfsutils openssh-client openssh-keygen sudo

RUN addgroup -g 1000 "${GROUP}" && \
    adduser -u 1000 -D -G "${GROUP}" "${USER}" && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

USER "${USER}"

ENV PACKER_LOG=1
ENV PS1="[\u@\h \W]# "

ENTRYPOINT ["/bin/packer"]


