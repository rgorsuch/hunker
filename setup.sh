
cp shared ~/.shared
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc_local
echo ". ~/.bashrc_local" >> ~/.bashrc

echo "Do not forget to "
echo
echo '  git config --global user.name "User Name"'
echo '  git config --global user.email you@mail.com'
echo
