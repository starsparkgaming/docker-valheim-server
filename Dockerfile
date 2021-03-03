FROM        ubuntu:latest

RUN         dpkg --add-architecture i386 \
            && apt update \
            && apt upgrade -y \
            && apt install -y tar curl lib32gcc1 libgcc1 ca-certificates \
            && useradd -m -d /home/container -u 1000 -g 1000 container

USER        container
ENV         HOME /home/container
ENV         NAME "Valheim Docker Server"
ENV         WORLD "Dedicated"
ENV         PASSWORD "12345"
ENV         PORT "2456"

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
