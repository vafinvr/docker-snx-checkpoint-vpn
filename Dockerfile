FROM ubuntu:18.04

ADD scripts/snx_install_n.sh /root

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y bzip2 kmod libstdc++5:i386 libpam0g:i386 libx11-6:i386 expect iptables net-tools iputils-ping iproute2

RUN cd /root && bash -x snx_install_n.sh

ADD scripts/snx.sh /root

RUN chmod +x /root/snx.sh

CMD ["/root/snx.sh"]
