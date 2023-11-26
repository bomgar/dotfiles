if status is-interactive
  # Commands to run in interactive sessions can go here
  fish_config theme choose "Catppuccin Mocha"
  set -g fish_greeting

  # Emulates vim's cursor shape behavior
  # Set the normal and visual mode cursors to a block
  set fish_cursor_default block blink
  # Set the insert mode cursor to a line
  set fish_cursor_insert line blink
  # Set the replace mode cursor to an underscore
  set fish_cursor_replace_one underscore blink
  # The following variable can be used to configure cursor shape in
  # visual mode, but due to fish_cursor_default, is redundant here
  set fish_cursor_visual block blink

  set fish_vi_force_cursor true
  fish_vi_key_bindings
  fish_vi_cursor

  bind -M insert \cp up-or-search
  bind -M insert \cn down-or-search
  bind -M insert \cf accept-autosuggestion

  if test -x (command -v fw)
    if test -x (command -v sk)
      fw print-fish-setup -s | source
    else
      fw print-fish-setup | source
    end
  end

  starship init fish | source

  bind \cr 'fzf_history_widget'

  functions -e ls
  functions -e la
  functions -e ll
  functions -e lt

  alias ls "command eza --icons=auto"
  alias la "command eza -la --icons=auto"
  alias ll "command eza -l --icons=auto"
  alias lt "command eza --tree --icons=auto"
  alias zbn "zellij action rename-tab (basename (pwd))"
  alias vim nvim
  alias pwn-docker 'docker rm -f (docker ps -a -q)'
  alias back-to-master "git checkout (git remote show origin | awk '/HEAD branch/ { print \$3 }') && git uff && git-trim"
  alias gst "git status"

  set -x SUDO_EDITOR nvim
  set -x EDITOR nvim
  set -x PAGER bat
  set -x WORDCHARS '*?_-.[]~=&;!#$%^(){}<>'
  set -x PATH ~/bin ~/.cargo/bin ~/go/bin $PATH
  set -x GOPATH ~/go


end
