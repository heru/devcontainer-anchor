FROM node:20.5.1-slim

RUN apt update && apt install  openssh-server sudo curl git pkg-config build-essential make libudev-dev libssl-dev llvm clang  -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1010 user && usermod -aG sudo user && service ssh start

RUN  echo 'user:passwd' | chpasswd

COPY solana-install.sh /home/ubuntu

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
