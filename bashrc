
alias sbt='/usr/bin/sbt "$@" ; stty erase '
alias ers='echo "stty erase ^H" ; stty erase '
alias share='/usr/bin/screen -c ~/.shared -S shared'
alias pd='rlwrap perl -MData::Dumper -MFile::Spec -MFile::Basename=basename,dirname -de "sub pp (@) { print Dumper(@_) }"'
set -o vi
