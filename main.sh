!#/bin/bash
#variables to assign before running
#$AWS_PROFILE_NAME

source ./wifi.sh
#essentials
sudo apt install wget ncdu git curl dnsutils git-core curl build-essential openssl libssl-dev zip

#git
git config credential.helper store --global

#node
sudo apt-get install nodejs
sudo npm install yarn -g

#java
sudo add-apt-repository ppa:webupd8team/java
sudo apt install default-jre

#pantheon
sudo apt install apt-transport-https software-properties-common wget
wget https://gandalfn.ovh/debian/pool/main/p/pantheon-debian-repos/pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb
sudo dpkg -i pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb
sudo apt update
sudo apt install pantheon
sudo apt install pantheon-shell
sudo apt-get install pantheon --fix-missing

#Virtualbox Note: not currently feasible; requires signing modules, and that process doesn't seem to take on my machine. 
#Alternative is disabling secure boot so modules don't need to be signed
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
#echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

#jenkins
sudo apt install jenkins
sudo service jenkins restart
echo "Jenkins Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#aws cli
pip3 install awscli --upgrade --user
aws configure --profile $AWS_PROFILE_NAME

#Terraform 
curl https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip --output terraform_0.12.9_linux_amd64.zip #consider adjusting for version
unzip terraform_0.12.9_linux_amd64.zip
mv terraform /usr/local/bin

#kubctl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

#kops
wget https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops
sudo mv kops-linux-amd64 /usr/local/bin/kops

#zsh
sudo apt install zsh
sudo chsh -s /usr/bin/zsh root
sudo chsh -s /usr/bin/zsh $(whoami)

#helpers
source ./helpers.sh

#project init
source ./projects.sh
