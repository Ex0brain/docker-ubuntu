FROM nitrousio/ubuntu-bare:latest
MAINTAINER Nitrous.IO <hello@nitrous.io>

# Install essential tools
RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -yy --no-install-recommends build-essential cmake gdb curl wget screen tmux zsh silversearcher-ag ack-grep gnupg bzip2 zip unzip unison man-db sqlite3 bison gawk telnet vim-nox emacs24-nox nano git git-svn mercurial bzr subversion libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libxml2-dev libxslt1-dev libbz2-dev libncurses5-dev libncursesw5-dev libsqlite3-dev libffi-dev && \
  apt-get clean
