# Utilishell container

FROM debian:stable-slim

# Install updates and repo hosted tools and cleanup
# currently missing due to dependency errors - postgresql-client
RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y curl htop nano-tiny vim-tiny git make tree \
    mysql-client sudo gdebi && \ 
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y

# copy the utility scripts in
COPY ./extras/* /usr/local/bin/

# add the user
RUN useradd --create-home --shell /bin/bash utilishell

# set up sudoers
RUN echo 'utilishell ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Use the utilishell user from now on
USER utilishell
WORKDIR /home/utilishell

# set up .bashrc
RUN echo 'export PS1="\[\033[95m\]\u \[\033[32m\]\W\[\033[33m\] [\$(git symbolic-ref --short HEAD 2>/dev/null)]\[\033[00m\]\$ "\n\
\n\
# Change tree to unicode\n\
alias tree="tree --charset unicode"\n\
\n\
# ll\n\
alias ll="ls -l"\n\
# vim\n\
alias vim="vi"\n\
# nano\n\
alias nano="nano-tiny"\n\
\n\
# bash history mods\n\
export HISTCONTROL=ignoreboth:erasedups' >> ~/.bashrc

ENTRYPOINT ["/bin/bash"]
