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

# Custom functions

## git utils
function gc
    git add .
    git commit -m "$argv"
end

function gp
    git add .
    git commit -m "$argv"
    git push
end

function crepo
    if test (count $argv) -eq 0
        echo "enter the repository name"
        return
    end

    if test -d "$argv[1]"
        echo "directory $argv[1] already exists"
        return
    end

    if test "$argv[2]" = "pub"
        gh repo create $argv[1] --public
    else
        gh repo create $argv[1] --private
    end

    mkdir $argv[1]
    cd $argv[1]
    git init
    git remote add origin git@github.com:uttamkn/$argv[1].git
end

function drepo
    if test (count $argv) -eq 0
        echo "enter the repository name"
        return
    end

    if not test -d "$argv[1]"
        echo "directory $argv[1] does not exist"
        return
    end

    if test "$argv[1]" = "/"
        echo "nah"
        return
    end

    gh repo delete $argv[1]
    sudo rm -rf $argv[1]
end


## venv setup
function svenv
    set VENV_DIR ".venv"
    set REQUIREMENTS_FILE "requirements.txt"

    if test (count $argv) -gt 0
        set VENV_DIR "$argv[1]"
    end

    if test (count $argv) -gt 1
        set REQUIREMENTS_FILE "$argv[2]"
    end

    if test -d "$VENV_DIR"
        echo "Removing existing virtual environment..."
        rm -rf "$VENV_DIR"
    else if test -d ".venv"
        rm -rf .venv
    end

    echo "Creating a new virtual environment using python3 -m venv..."
    python3 -m venv "$VENV_DIR"

    source "$VENV_DIR/bin/activate.fish"

    if test -f "$REQUIREMENTS_FILE"
        echo "Installing requirements from $REQUIREMENTS_FILE..."
        pip install -r "$REQUIREMENTS_FILE"
    else
        echo "$REQUIREMENTS_FILE not found. Skipping installation of requirements."
    end

    echo "Setup complete."
end


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


# unzip
function _is-clean-zip --argument zipfile
    set summary (zip -sf $zipfile | string split0)
    set first_file (echo $summary | row 2 | string trim)
    set first_file_last_char (echo $first_file | string sub --start=-1)
    set n_files (echo $summary | awk NF | tail -1 | coln 2)
    test $n_files = 1 && test $first_file_last_char = /
end

function uzip --argument zipfile
    if not test (echo $zipfile | string sub --start=-4) = .zip
        echo (status function): argument must be a zipfile
        return 1
    end

    if _is-clean-zip $zipfile
        unzip $zipfile
    else
        set folder_name (echo $zipfile | string split '.zip')[1]
        set target (basename $folder_name)
        mkdir $target || return 1
        unzip $zipfile -d $target
    end
end



# Alias

## misc
alias ...='cd ../..'
alias la='ls -a'
alias vim='nvim'
alias cls='clear; fastfetch'
alias vate='source .venv/bin/activate'
alias c='code'

## config
alias efrc='vim ~/.config/fish/config.fish'
alias ehypr='vim ~/.config/hypr/hyprland.conf'

## git
alias gs 'git status'
alias ga 'git add'
# gc and gp are defined above #



#Autojump
if test -s /home/utmkn/.autojump/etc/profile.d/autojump.fish
    source /home/utmkn/.autojump/etc/profile.d/autojump.fish
end

# fastfetch on start looks cool
fastfetch

