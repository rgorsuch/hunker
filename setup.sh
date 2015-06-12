
function apt-install {
  
  # Install a package (with a given command) if not already installed

  PACKAGE=$1
  INSTALL_COMMAND=$2

  if [ $# -eq 1 ]; then
    # Default installation command
    INSTALL_COMMAND="sudo apt-get install $PACKAGE"
  else
    # Specified installation command
    INSTALL_COMMAND="$2"
  fi

  if ! dpkg -l $PACKAGE >/dev/null ; then
    $INSTALL_COMMAND
  fi

}

apt-install unzip
apt-install openjdk-7-jdk
apt-install nodejs "curl -sL https://deb.nodesource.com/setup | sudo bash - && sudo apt-get install -y nodejs"

# Install sbt: http://www.scala-sbt.org/0.13/tutorial/Installing-sbt-on-Linux.html
if ! hash sbt ; then
  echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-get update
  sudo apt-get install sbt
fi

# Install rally-app-builder
if ! hash rally-app-builder ; then
  npm install rally-app-builder 
  sudo ln -s /home/ubuntu/node_modules/rally-app-builder/bin/rally-app-builder /usr/local/bin/rally-app-builder
fi

# Install maven
if ! hash mvn ; then
  wget http://www.carfab.com/apachesoftware/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
  sudo mkdir -p /usr/local/apache-maven
  sudo tar xvf apache-maven-3.0.5-bin.tar.gz -C /usr/local/apache-maven
  rm apache-maven-3.0.5-bin.tar.gz
  echo 'export PATH=$PATH:/usr/local/apache-maven/apache-maven-3.0.5/bin' >>~/.bashrc_local
  echo 'export JAVA_HOME=dirname $(dirname $(readlink $(readlink $(which javac))))' >>~/.bashrc_local
  cp -r m2/* ~/.m2/
fi

if ! hash activator ; then
  wget http://downloads.typesafe.com/typesafe-activator/1.3.4/typesafe-activator-1.3.4.zip
  sudo unzip -d /usr/local/ typesafe-activator-1.3.4.zip
  sudo chown -R $USER:$USER /usr/local/activator-1.3.4
  sudo ln -s /usr/local/activator-1.3.4/activator /usr/local/bin/activator
  rm -f typesafe-activator-1.3.4.zip
fi

# Customize environment
cp shared ~/.shared
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc_local
if ! grep -q .bashrc_local ~/.bashrc ; then
  echo ". ~/.bashrc_local" >> ~/.bashrc
fi



# Suggestions
echo "Do not forget to "
echo
echo '  git config --global user.name "User Name"'
echo '  git config --global user.email you@mail.com'
echo
