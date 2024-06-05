FROM alpine:3.11
RUN apk add --no-cache openssh-client ansible git sshpass
RUN mkdir -p /root/.ssh
RUN echo "HOST *" > /root/.ssh/config && echo " StrictHostKeyChecking no" >> /root/.ssh/config

COPY ./ansible /ansible

WORKDIR /ansible

CMD ["ansible-playbook", "-i", "inventories/servers.yml", "main.yml"]
