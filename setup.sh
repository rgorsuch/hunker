
# Install sbt: http://www.scala-sbt.org/0.13/tutorial/Installing-sbt-on-Linux.html
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get update
sudo apt-get install sbt

# Customize environment
cp shared ~/.shared
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc_local
echo ". ~/.bashrc_local" >> ~/.bashrc

# Suggestions
echo "Do not forget to "
echo
echo '  git config --global user.name "User Name"'
echo '  git config --global user.email you@mail.com'
echo
