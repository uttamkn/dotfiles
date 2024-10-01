# Delete remote repo
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
