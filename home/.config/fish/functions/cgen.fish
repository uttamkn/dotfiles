# Function to generate build system files for cpp projects using cmake
function cgen
    cmake -S . -B build
end
