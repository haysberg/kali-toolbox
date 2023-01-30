FROM docker.io/kalilinux/kali-rolling:latest

LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install sudo libcap2-bin openvpn && \
    apt-get clean

RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers

RUN touch /etc/localtime
RUN echo VARIANT_ID=container >> /etc/os-release

CMD /bin/bash