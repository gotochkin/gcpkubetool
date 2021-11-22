FROM gcr.io/google.com/cloudsdktool/cloud-sdk:latest
RUN apt-get install -y \
    kubectx \
    vim \
    bash-completion \
    telnet
# Nomos intallation is commented since Google prohibited anonymous installation of the utility since 2021-11-22
#RUN gsutil cp gs://config-management-release/released/latest/linux_amd64/nomos /usr/bin/nomos; chmod +x /usr/bin/nomos && \
RUN curl -L https://github.com/derailed/k9s/releases/download/v0.25.3/k9s_Linux_x86_64.tar.gz | tar xz  -C /usr/bin && \
    echo "alias g=gcloud" >> ~/.bashrc && \
    echo "alias ll='ls -l" >> ~/.bashrc && \
    echo "source /etc/bash_completion" >> ~/.bashrc && \
    echo "alias k=kubectl" >> ~/.bashrc && \
    echo "source <(kubectl completion bash)" >> ~/.bashrc && \
    echo "complete -F __start_kubectl k" >> ~/.bashrc
