# to run cpp files
function run
  if test -z $argv[1]
    echo "Usage: run <cpp_file>"
    return
  end

  g++ $argv[1] && ./a.out && rm a.out
end
