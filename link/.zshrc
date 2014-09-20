# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

DOTFILES="$HOME/.dotfiles"
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$DOTFILES/zsh/custom"
ZSH_THEME="vonder"
HISTFILE="$HOME/.cache/.zsh_history"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# set oh my zsh plugins
plugins=(git zsh-syntax-highlighting git-extras ruby composer cp jira aws)

# OS specific settings
if [[ "$(uname)" =~ ^Darwin ]]; then
    plugins+=brew
    plugins+=osx
fi

export EDITOR=$(which vim)
export VISUAL="$EDITOR"

# User configuration
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/Users/guy/google-cloud-sdk/bin/:/Users/guy/jmeter/apache-jmeter-2.11/bin/"
export SSH_KEY_PATH="~/.ssh"
export AWS_CONFIG_FILE="~/.aws-config"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# create cache dir if it doesn't exist
[[ ! -d "$HOME/.cache" ]] && mkdir "$HOME/.cache"

# Source oh my zsh
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# list all files in directory not alerting about no match
for file in $DOTFILES/source/*(-.N); do
    source $file
done

# list all files in ~/local/*.local
for file in $HOME/local/*.local(-.N); do
    source $file
done
unset file

# Add npm completion
eval "$(npm completion 2> /dev/null)" || echo "Please install NPM."

# grunt completion
eval "$(grunt --completion=zsh 2> /dev/null)" || echo "Please install Grunt Cli: npm i -g grunt-cli"

# gulp completion
eval "$(gulp --completion=zsh 2> /dev/null)" || echo "Please install gulp: npm i -g gulp"

# set fasd data file location
export _FASD_DATA="$HOME/.cache/.fasd"
# Fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install 2> /dev/null)" || echo "Please install fasd"

fpath=(/Users/guy/zsh/gcloud-zsh-completion/src/ $fpath)
autoload -U compinit compdef
compinit

[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh
alias dev='ssh -p 59345 guy.a.blazemeter.com'
alias logt='ssh -p 59345 guy.a.blazemeter.com "sudo tail -100f /var/log/apache2/guy_a_error.log"'
alias logl='ssh -p 59345 guy.a.blazemeter.com "sudo cat /var/log/apache2/guy_a_error.log" | less'
alias stg='ssh -i /Users/guy/.ssh/bzcommercial.pem alongir@stg.a.blazemeter.com'
alias debug='ssh -p 59345 guy.a.blazemeter.com "sudo tail -100f /tmp/guy.a.blazemeter.com/default_debug.log"'
alias devenv='ssh -p 59345 guy.a.blazemeter.com "vim /home/guy/vol/www/drupal/sites/a.blazemeter.com/env.php"'

alias tmux='TERM=xterm-256color tmux -u'

export LANG=en_US.UTF-8

PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

