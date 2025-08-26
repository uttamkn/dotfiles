# Create remote repo
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
