# vim: filetype=fish
if status is-interactive
  # Commands to run in interactive sessions can go here


  set fish_theme "Rosépine Dawn"
  fish_config theme choose $fish_theme

  set -x PATH ~/bin ~/.cargo/bin ~/go/bin ~/.local/bin $PATH

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

  if command -q nvim
    set -x MANPAGER "nvim +Man!"
  end


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
  abbr --add lg lazygit

  set -x SUDO_EDITOR nvim
  set -x EDITOR nvim
  set -x PAGER bat
  set -x WORDCHARS '*?_-.[]~=&;!#$%^(){}<>'
  set -x GOPATH ~/go
  if test "$fish_theme" = "Rosépine"
    set -x LG_CONFIG_FILE $HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/config_dark.yml
    set -x FZF_DEFAULT_OPTS " \
      --reverse
      --color=fg:#908caa,bg:#191724,hl:#ebbcba
      --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
      --color=border:#403d52,header:#31748f,gutter:#191724
      --color=spinner:#f6c177,info:#9ccfd8
      --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
  else
    set -x LG_CONFIG_FILE $HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/config_light.yml
    set -x FZF_DEFAULT_OPTS " \
          --reverse
          --color=fg:#797593,bg:#faf4ed,hl:#d7827e
          --color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
          --color=border:#dfdad9,header:#286983,gutter:#faf4ed
          --color=spinner:#ea9d34,info:#56949f
          --color=pointer:#907aa9,marker:#b4637a,prompt:#797593"
  end
  # created by dircolors and converted to fish
  set -x LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';

end
