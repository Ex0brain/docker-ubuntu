FROM ubuntu-upstart:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

# Create action user and give sudo
RUN \
  useradd --create-home -s /bin/bash action && \
  adduser action sudo && \
  mkdir -p /etc/sudoers.d && \
  echo %action ALL=NOPASSWD:ALL > /etc/sudoers.d/action && \
  chmod 0440 /etc/sudoers.d/action

# Install essential tools
RUN \
  apt-get update && \
  apt-get install -yy --no-install-recommends build-essential cmake gdb curl wget screen tmux zsh silversearcher-ag ack-grep gnupg bzip2 zip unzip unison man-db sqlite3 bison gawk telnet vim-nox emacs24-nox nano git git-svn mercurial bzr subversion libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libxml2-dev libxslt1-dev libbz2-dev libncurses5-dev libncursesw5-dev libsqlite3-dev libffi-dev && \
  apt-get clean

ADD files/ssh_bootstrap.sh /etc/ssh/ssh_bootstrap.sh
ADD files/ssh.conf /etc/init/ssh.conf
ADD files/sshd_config /etc/ssh/sshd_config
