#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
   source /etc/profile.d/vte.sh
fi

# alias ls='ls --color=auto'
alias ls='exa --icons --group-directories-first'
alias grep='grep --color=auto'
alias cat='bat'

# PS1='[\u@\h \W]\$ '

export PATH=~/.local/bin:$PATH
#export GTK_THEME=Orchis-Dark-Compact

source ~/liquidprompt/liquidprompt
source ~/liquidprompt/themes/powerline/powerline.theme
lp_theme powerline

source /usr/share/git/completion/git-completion.bash
