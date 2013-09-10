# Purge repositories
apt-get purge oracle-java7-installer*
apt-get install ppa-purge
ppa-purge ppa:eugenesan/java
apt-get clean
apt-get update

#Accept license
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#Install JDK
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java7-installer

java -version

#Update alternatives
sudo update-java-alternatives -s java-7-oracle

export JAVA_HOME=/usr/lib/jvm/java-7-oracle
