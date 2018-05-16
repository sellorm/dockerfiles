# Utilishell container

FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y curl htop nano-tiny vim-tiny git make tree \
    mysql-client postgresql-client && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y

COPY ./extras/dl /usr/local/bin/dl

RUN useradd --create-home --shell /bin/bash utilishell

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
