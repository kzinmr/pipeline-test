sudo apt update;sudo apt upgrade -y;sudo apt install -y default-jdk

# wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install -y jenkins
# sudo systemctl status jenkins

sudo usermod -a -G root jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

