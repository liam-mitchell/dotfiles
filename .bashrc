export XENVIRONMENT="${HOME}/.Xresources"
export PROMPT_DIRTRIM=3

export PATH=$PATH:$HOME/bin
export EDITOR='emacs -nw'

export HISTSIZE=4096
export HISTFILESIZE=4096

. $HOME/.bash_profile

shopt -s histappend

setconky() {
    i=$1
    if (( $i == 0 ))
    then
        sed -i 's:hwmon 1:hwmon 0:g' ~/.conkyrc
    else
        sed -i 's:hwmon 0:hwmon 1:g' ~/.conkyrc
    fi
}

PATH="/home/liam/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/liam/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/liam/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/liam/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/liam/perl5"; export PERL_MM_OPT;
