# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# disable oh-my-zsh themes for pure prompt
# ZSH_THEME=""
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zdharma/fast-syntax-highlighting", as:plugin, defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
zplug 'zsh-users/zsh-completions', depth:1 # more completions
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh

zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"


# zplug "mafredri/zsh-async", from:github
zplug load
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

#---------------------------SOURCE FILES--------------------------------------

source ~/.antilles/sdk_env_vars.sh
source ~/.antilles/antilles_completion.zsh
source ~/.antilles/antilles_completion.bash
source ~/.cdm/cdm_completion.bash
source ~/.antilles/sdk_env_vars.sh
source ~/.antilles/set_virtualenv.sh
#------------------------------EXPORT-----------------------------------------


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#------------------------------ALIASES----------------------------------------
#soure
alias activate='source $PWD/.env/bin/activate'
alias src="source ~/.zshrc"

#navigate
alias oc="cd ~/Code"
alias ra="cd ~/.antilles"
alias ant="cd ~/Code/antilles"
alias cal="cd ~/Code/CaliperAPI/caliper-api"
alias lb="cd ~/Code/lumberyard"
alias ad="cd ~/Code/antilles-deployer"
alias dbm="cd ~/Code/dbm"
alias rb="cd ~/Code/review-buddy"
alias tt="cd ~/Code/training"
alias training="cd ~/Code/training"
alias stnl="cd ~/Code/funds-transfer-score"
alias vconfig="cd ~/.config/nvim"
alias ctester="cd ~/.config/nvim/.hidden/config_tests"
alias notes="cd ~/Desktop/notes"

alias cert="cd ~/Desktop/Certifications"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias .="cd .."
alias ..="cd ../.."

#open
alias zconfig="vim ~/.zshrc"
alias zeconfig="vim ~/.config/zellij/config.kdl"
alias voc="vim ~/Code"
alias openpacker="vim ~/.config/nvim/lua/plugins/packer_plugins.lua"
alias openlua="vim ~/.config/nvim/lua"
alias openmappings="vim ~/.config/nvim/lua/utils/mappings.lua"
alias openoptions="vim ~/.config/nvim/lua/utils/options.lua"
alias openplugins="vim ~/.config/nvim/plugin"
alias vra="vim ~/.antilles/sdk_env_vars.sh"
alias vnotes="vim ~/Desktop/notes"
alias shared="ssh sdk-shared-dev.q2devstack.com -l solene.sossah@q2.com"

#rename
alias ze='zellij'
alias vim="nvim"

#export
alias nomadaws='export NOMAD_ADDR=http://dev-01-nomad.q2developer.com:4646;nomad'

#misc
alias weather='curl wttr.in/22304'
alias work="timer 55m && terminal-notifier -message 'Pomodoro'\
            -title 'Work Timer is up! Take a Break 📘'\
            -appIcon '~/Pictures/pumpkin.png'\
            -sound Crystal"

alias rest10="timer 10m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Get back to work 📖'\
            -appIcon '~/Pictures/pumpkin.png'\
            -sound Crystal"

alias rest5="timer 5m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Get back to work 📖'\
            -appIcon '~/Pictures/pumpkin.png'\
            -sound Crystal"

alias rest5s="timer 5s && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Get back to work 📖'\
            -appIcon '~/Pictures/pumpkin.png'\
            -sound Crystal"
#------------------------------RUN----------------------------------------

# #automatically activating directory if it contains the activate shell script
# chpwd() {
#   if [ -f "$PWD/.env/bin/activate" ]; then
#     source $PWD/.env/bin/activate
#   fi
# }


# # Removing host name from terminal
# prompt_context() {
#     if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#         prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#     fi
# }

# # autostart zellij
# eval "$(zellij setup --generate-auto-start zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zellij setup --generate-auto-start zsh)"
# (( ${+commands[zellij]} )) && eval "$(zellij setup --generate-auto-start zsh)"
#
# eval "set -o vi"
