
# Install sbt: http://www.scala-sbt.org/0.13/tutorial/Installing-sbt-on-Linux.html
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get update
sudo apt-get install sbt

# Install node.js
curl -sL https://deb.nodesource.com/setup | sudo bash - && sudo apt-get install -y nodejs

# Install rally-app-builder
npm install rally-app-builder 
sudo ln -s /home/ubuntu/node_modules/rally-app-builder/bin/rally-app-builder /usr/local/bin/rally-app-builder

# Customize environment
cp shared ~/.shared
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc_local
echo ". ~/.bashrc_local" >> ~/.bashrc

# Install maven
wget http://www.carfab.com/apachesoftware/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
sudo mkdir -p /usr/local/apache-maven
sudo tar xvf apache-maven-3.0.5-bin.tar.gz -C /usr/local/apache-maven
echo 'export PATH=$PATH:/usr/local/apache-maven/apache-maven-3.0.5/bin' >>~/.bashrc_local
echo 'export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre' >>~/.bashrc_local
mvn --version

# Suggestions
echo "Do not forget to "
echo
echo '  git config --global user.name "User Name"'
echo '  git config --global user.email you@mail.com'
echo
