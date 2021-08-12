# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/rafael.martins/.oh-my-zsh"
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
# --color info:144,prompt:161,spinner:135,pointer:135,marker:118
# '
# --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
# --color info:144,prompt:161,spinner:135,pointer:135,marker:118a'

# export BAT_THEME="Monokai Extended Origin"

# DISABLE_MAGIC_FUNCTIONS=true

# alias
alias vi="nvim"
alias reload="source ~/.zshrc" alias ls="lsd"
alias ll="ls -l"
alias la="ls -la"
alias lt="ls --tree"
alias moc="eval $(minishift oc-env)"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
	print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
	command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
	command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
		print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
		print -P "%F{160}▓▒░ The clone has failed.%f"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# if [ -z "$TMUX" ]
# then
#     tmux attach -t work || tmux new -s work
# fi

# Oh-my-zsh plugins
# zinit snippet OMZ::lib/history.zsh

# zinit snippet OMZ::lib/key-bindings.zsh

# zinit ice wait lucid
# zinit snippet OMZ::lib/completion.zsh

# zinit ice wait lucid
# zinit snippet OMZ::lib/grep.zsh

# # Oh-my-zsh plugins
# zinit ice wait lucid atload"unalias grv"
# zinit snippet OMZ::plugins/git/git.plugin.zsh

# zinit ice wait lucid
# zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# zinit ice wait lucid
# zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# zinit ice wait lucid
# zinit snippet OMZ::plugins/extract/extract.plugin.zsh

# zinit ice wait lucid
# zinit snippet OMZ::plugins/golang/golang.plugin.zsh

# zinit ice wait lucid
# zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

# # Plugins
# zinit ice depth=1 lucid
# zinit light trystan2k/zsh-tab-title

# zinit ice depth=1 wait lucid
# zinit light Aloxaf/fzf-tab

# zinit ice depth=1 wait blockf lucid atpull"zinit creinstall -q ."
# zinit light clarketm/zsh-completions

# zinit ice depth=1 wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
# zinit light zdharma/fast-syntax-highlighting

# zinit ice depth=1 wait lucid compile"{src/*.zsh,src/strategies/*.zsh}" atload"_zsh_autosuggest_start"
# zinit light zsh-users/zsh-autosuggestions

# zinit ice depth=1 wait"1" lucid atinit"zstyle ':history-search-multi-word' page-size '20'"
# zinit light zdharma/history-search-multi-word

# zinit ice depth=1 wait"2" lucid
# zinit light wfxr/forgit

# zinit ice depth=1 wait"2" lucid
# zinit light hlissner/zsh-autopair

# zinit ice depth=1 wait"2" lucid
# zinit light peterhurford/up.zsh

# zinit ice depth=1 wait"2" lucid
# zinit light MichaelAquilina/zsh-you-should-use

zinit ice depth=1; 
zinit light romkatv/powerlevel10k

# open file
fo() {
  #IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  IFS=$'\n' out=($(fzf --query="$1" --multi))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-nvim} "$file"
  fi
}

# cd directory and open file can pass word
fcd() {
  local dir
  dir=$(fd --hidden --type d "$1" . $HOME | fzf --preview 'tree -C {}' +m) && cd "$dir"
}

# cd directory and open file can pass word
co() {
  local dir
  dir=$(fd --hidden --type d "$1" . $HOME | fzf --preview 'tree -C {}' +m) && cd "$dir" && fo
}

# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

#bindkey -v '?' sudo-command-line
# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
