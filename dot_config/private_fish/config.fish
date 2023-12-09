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
  set fish_cursor_replace underscore blink
  # The following variable can be used to configure cursor shape in
  # visual mode, but due to fish_cursor_default, is redundant here
  set fish_cursor_visual block blink

  set fish_vi_force_cursor true
  fish_vi_key_bindings
  fish_vi_cursor

  bind -M insert \cp up-or-search
  bind -M insert \cn down-or-search
  bind -M insert \cf accept-autosuggestion

  if command -q fzf
    fzf_key_bindings
  end
  if command -q fnm
    fnm env | source
  end

  if command -q fw
    if command -q fzf
      fw print-fish-setup -f | source
    else
      fw print-fish-setup | source
    end
  end

  if command -q starship
    starship init fish | source
  end

  if command -q eza
    functions -e ls
    functions -e la
    functions -e ll
    functions -e lt

    alias ls "command eza --icons=auto"
    alias la "command eza -la --icons=auto"
    alias ll "command eza -l --icons=auto"
    alias lt "command eza --tree --icons=auto"
  end

  alias zbn "zellij action rename-tab (basename (pwd))"
  alias pwn-docker 'docker rm -f (docker ps -a -q)'
  alias back-to-master "git checkout (git remote show origin | awk '/HEAD branch/ { print \$3 }') && git uff && git-trim"

  abbr --add gst "git status"
  abbr --add vim nvim

  set -x SUDO_EDITOR nvim
  set -x EDITOR nvim
  set -x PAGER bat
  set -x WORDCHARS '*?_-.[]~=&;!#$%^(){}<>'
  set -x PATH ~/bin ~/.cargo/bin ~/go/bin $PATH
  set -x GOPATH ~/go
  set -x FZF_DEFAULT_OPTS "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
  set -x SKIM_DEFAULT_OPTIONS "--color=fg:#cdd6f4,bg:#1e1e2e,matched:#313244,matched_bg:#f2cdcd,current:#cdd6f4,current_bg:#45475a,current_match:#1e1e2e,current_match_bg:#f5e0dc,spinner:#a6e3a1,info:#cba6f7,prompt:#89b4fa,cursor:#f38ba8,selected:#eba0ac,header:#94e2d5,border:#6c7086"

end
