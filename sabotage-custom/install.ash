#!/bin/sh

butch install automake
butch install autoconf

butch install bash
butch install bindutils
butch install coreutils
butch install dropbear
butch install file
butch install diffutils
butch install git
butch install htop
butch install mlocate
butch install nmap
butch install openssh
butch install procps
butch install screen
butch install vim
butch install wget

update-ca-certificates

echo /bin/ash > /etc/shells
echo /bin/bash >> /etc/shells

# escape in da place
cat >> /etc/profile <<EOF

if [ "`whoami`" = "root" ]]; then
        PS1="$HOSTNAME# "
else
        PS1="$HOSTNAME> "
fi

case "\$-" in *i*)
        alias ll='ls --color=auto -alh'
        alias ls='ls --color=auto'
        alias cp='cp -i'
        alias mv='mv -i'
        alias rm='rm -i'
        ;;
esac

EOF

ln -sf vim /bin/vi

cat >> /root/.vimrc <<EOF
set mouse=
set paste
syn on
EOF

