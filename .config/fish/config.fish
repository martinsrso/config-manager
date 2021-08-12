if status is-interactive
  # Commands to run in interactive sessions can go here
  # ~/.config/fish/config.fish
  #set -l onedark_options '-b'

  #if set -q VIM
  #  # Using from vim/neovim.
  #  set onedark_options "-256"
  #else if string match -iq "eterm*" $TERM
  #  # Using from emacs.
  #  function fish_title; true; end
  #  set onedark_options "-256"
  #end

  #set_onedark $onedark_options

  # variable 
  set --universal -x GOPATH $HOME/go
  fish_add_path GOPATH/bin

  alias vi="nvim"
  alias ll="ls -l"
  alias la="ls -la"
  alias lt="ls --tree"
  alias ls="lsd"
  alias reload="source ~/.config/fish/config.fish"
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

  set --universal tide_right_prompt_items status cmd_duration context jobs node virtual_env php go
  set -a tide_right_prompt_items kubectl
  set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern
  # set -a tide_right_prompt_items kubectl
  #alias moc="eval $(minishift oc-env)"

end
