# Create a new alias and store it in ~/.config/fish/custom-aliases.fish
function al

  # if -r flag is passed, remove the alias from the file using vim (no idea how to automate this)
  if test "$argv[1]" = "-r"
    vim ~/.config/fish/custom-aliases.fish
    return
  end

  if test (count $argv) -lt 2
      echo "Usage: al <alias> <command>"
      return
  end

  if test "$argv[1]" = "al"
      echo "Cannot alias the alias command"
      return
  end

  # if -b flag is passed, run the command in the background
  if test "$argv[3]" = "-b"
    echo "alias $argv[1]='nohup $argv[2]' > /dev/null 2>&1 &" >> ~/.config/fish/custom-aliases.fish
    return
  end

  echo "alias $argv[1]='$argv[2]'" >> ~/.config/fish/custom-aliases.fish
end

# Usage: al <alias> <command> to create a new alias
# al -r to remove an alias (opens the file in vim and you have to manually delete the line)
# al <alias> <command> -b to run the command in the background
