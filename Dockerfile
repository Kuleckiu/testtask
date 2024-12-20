FROM ubuntu:24.04
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    gnupg \
    nano \
    && apt-get clean
RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 22 80
CMD ["/start.sh"]