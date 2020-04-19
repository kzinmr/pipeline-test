# pipeline-test

A Jenkins pipeline demo with the following steps:
- Test and lint a sample Flask app
- Build and push docker image of the app

## Prerequisite

### Setup AWS
- Setup IAM Group policy
   - AmazonEC2FullAccess
   - AmazonVPCFullAccess
   - AmazonS3FullAccess.
- Create Users within the group & download the .csv file:
   - the Access Key, Secret Access Key, and the password
- Create a new key pair
   - chmod 400 your_user_name-key-pair-region_name.pem
- Create a security group & Right-click->Networking->change the security groups:
   - Protocol: TCP, Port Range: 8080, Source: 0.0.0.0/0
   - Protocol: SSH, Port Range: 22, Source: "My IP."

### Install Jenkins

On Ubuntu18.04LTS:
```
sudo apt update;sudo apt upgrade -y;sudo apt install -y default-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
sudo systemctl status jenkins

# sudo usermod -a -G root jenkins
# access http://your_ip:8080
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### Install Blue Ocean and create a new pipeline with git

### Install Docker:

On Ubuntu18.04LTS:
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce
```


### Setup credential information to push docker images to dockerhub


## References
- [withCredentials()](https://jenkins.io/doc/pipeline/steps/credentials-binding/)
- [Build and Push Docker Image on Jenkins](https://medium.com/@gustavo.guss/jenkins-building-docker-image-and-sending-to-registry-64b84ea45ee9)
