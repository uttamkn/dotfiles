# git push
function gp
    git add .
    git commit -m "$argv"
    git push
end
