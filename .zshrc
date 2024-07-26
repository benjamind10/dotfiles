# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
#ZSH_THEME="agnoster"
ZSH_THEME="xiong-chiamiov"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
  docker
  npm
  pip
)

# Changing "ls" to "exa"
alias lls='eza --icons'
alias lla='eza -l --icons'
alias lll='eza -al --icons'
alias llt='eza -aT --icons'
alias l.='eza -a | egrep "^\."'

source $ZSH/oh-my-zsh.sh

# Aliases
alias gita='git add -A'
alias gitc='git commit -m'
alias gitp='git push'
alias gits='git status'
alias gitclone='git clone'
alias aptupdate='sudo apt update'
alias aptupgrade='sudo apt upgrade -y'
alias snapinstall='sudo snap install'
alias aptinstall='sudo apt install -y'
alias please='sudo'
alias vim='nvim'
alias clock='tty-clock -c -C 7'
alias compress='tar -zcvf'
alias memory='~/.local/bin/memory'
alias kernel='~/.local/bin/kernel'
alias networktraffic='~/.local/bin/network'
alias cpu='~/.local/bin/cpu'
alias icat="kitten icat"
alias s="kitten ssh"
alias d="kitten diff"
alias sysummary='~/.local/bin/system_summary'
alias disksummary='~/.local/bin/disksummary'
alias sourcez='source ~/.zshrc'
alias c='clear'
alias x='exit'
alias h='history -10'
alias hc='history -c'
alias hg='history | grep '
alias ag='alias | grep '
alias grep='grep --color=auto'
alias idesigner='~/Documents/GPA/designerlauncher/app/designerlauncher.sh'
alias darkbot='sshfs root@104.236.193.213:/opt/darkbot ~/Documents/darkbot -o allow_other'
alias elev8cicd='sshfs bduran@192.168.1.166:/home/bduran/Documents/code/Elev8_CICD ~/Documents/GPA/elev8cicd_remote -o allow_other'
alias lgit='lazygit'
alias lgits='lazygit status'
alias newellvpn='sudo openconnect --protocol=gp --user=XV04474 nbprisma.newellco.com'
alias aptupgradable='apt list --upgradable'

#tail with color
tailcolor() {
    tail -f "$1" | ccze
}


# User configuration

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

nerdfetch


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
