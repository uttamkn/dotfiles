# receive 
function recv
    if test (count $argv) -ne 2
        echo "Usage: recv <link-id> <output-file>"
        return
    end

  curl https://0x0.st/$argv[1] -o $argv[2]
end
