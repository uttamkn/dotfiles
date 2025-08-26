# venv setup
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
