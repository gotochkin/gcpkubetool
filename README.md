# gcpkubetool
Docker image to work with K8 on Google Public Cloud
Image contains Google SDK from https://cloud.google.com/sdk/docs/install 

Kubernetes CLI from https://k9scli.io/
The kubectx utility 
The nomos utility from 
Some useful command line utilities like telnet and other 

Requirements:
Docker or any other tools to build and use docker type images.
Git utility to get the image:


To use the image you can do several simple steps:
Get the Dockerfile from https://github.com
git clone https://github.com/gotochkin/gcpkubetool.git
cd gcpkubetool

Build the image:
docker build --force-rm --tag gcloud:latest .

Get the authentication in the Google Cloud - this will create a container gcloud-config with your saved credentials:
docker run -ti --name gcloud-config gcloud:latest gcloud auth login

Run the image attaching the volume with authentication to the Google Cloud:
docker run -ti --rm --volumes-from gcloud-config gcloud:latest /bin/bash

Inside the container get the kubectl config from your GKE:
gcloud container clusters get-credentials your-gke-cluster --region us-central1

You can create an alias and put it to your bash profile or bashrc:
echo "alias gcloud='docker run -ti --rm --volumes-from gcloud-config gcloud:latest /bin/bash'" >~/.bashrc

2021-11-22 Correction
The nomos automatic install is removed because Google prohibited anonymous download "ServiceException: 401 Anonymous caller does not have storage.objects.get access to the Google Cloud Storage object."
You can add the nomos manually by executing:
gsutil cp gs://config-management-release/released/latest/linux_amd64/nomos /usr/bin/nomos; chmod +x /usr/bin/nomos
