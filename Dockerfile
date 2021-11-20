FROM gcr.io/google.com/cloudsdktool/cloud-sdk:latest
RUN apt-get install -y \
    vim \
    bash-completion \
    telnet
RUN gsutil cp gs://config-management-release/released/latest/linux_amd64/nomos /usr/bin/nomos; chmod +x /usr/bin/nomos
RUN echo "source <(kubectl completion bash)" >> ~/.bashrc ; echo "complete -F __start_kubectl k" >> ~/.bashrc
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
ENV ACCEPT_EULA=y
RUN apt-get update && \
    apt-get install -y mssql-tools unixodbc-dev && \ 
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc 
