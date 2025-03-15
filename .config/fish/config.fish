if test -s /home/utmkn/.config/fish/custom-aliases.fish
   source /home/utmkn/.config/fish/custom-aliases.fish
end

export VCPKG_ROOT=~/Downloads/vcpkg

if status is-interactive
  set fish_greeting
end

## sashimi prompt ##
function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -g red (set_color -o red)
  set -g blue (set_color -o blue)
  set -l green (set_color -o green)
  set -g normal (set_color normal)

  set -l ahead (_git_ahead)
  set -g whitespace ' '

  if test $last_status = 0
    set initial_indicator "$green◆"
    set status_indicator "$normal❯$cyan❯$green❯"
  else
    set initial_indicator "$red✖ $last_status"
    set status_indicator "$red❯$red❯$red❯"
  end
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]

    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($red$git_branch$normal)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($blue$git_branch$normal)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $initial_indicator $whitespace $cwd $git_info $whitespace $ahead $status_indicator $whitespace
end

function _git_ahead
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
  if [ $status != 0 ]
    return
  end
  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo "$blue↑$normal_c$ahead$whitespace"
    case '0 *'  # behind upstream
      echo "$red↓$normal_c$behind$whitespace"
    case '*'    # diverged from upstream
      echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end
## end of sashimi ##

# Functions

## for !! and !$ 
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

# Alias

## misc
alias ...='cd ../..'
alias ls='lsd -Fl'
alias la='lsd -Fla'
alias cls='clear'
alias vate='source .venv/bin/activate.fish'
alias icat='kitten icat'
alias cat='bat'
alias im='imv-wayland'
alias clean='sudo pacman -Rns $(pacman -Qtdq)'
alias rmn='rm -rf node_modules/'
alias rmv='rm -rf .venv/'
alias slp='systemctl suspend'

## fuzzy finder
alias fp='zathura --fork (fzf --query ".pdf")'
alias fd='zaread --fork (fzf --query "notes .docx")'
alias ff='nohup nvim (fzf) > /dev/null 2>&1 &'

## editors
alias nv='nvim'
alias c='windsurf'

## config
alias efrc='nvim ~/.config/fish/config.fish'
alias ehypr='nvim ~/.config/hypr/hyprland.conf'

## git
alias gs='git status'
alias ga='git add'
alias gl='git log --oneline --graph --decorate --parents'
# gc and gp are defined above #

alias j='z'

#Autojump
zoxide init fish | source

# go setup
set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# fastfetch on start looks cool
# fastfetch
# echo " "
