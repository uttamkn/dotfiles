# send
function send
  curl -F "file=@$argv" https://0x0.st | wl-copy
end
