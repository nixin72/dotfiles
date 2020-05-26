# Path to Oh My Fish install.
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"

set -gx PATH ~/.cargo/bin $PATH

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set -x PATH ~/.local/bin $PATH
source ~/.config/fish/conf.d/functions.fish
source ~/.config/fish/conf.d/aliases.fish

# Opam configuration
source /home/nixin72/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Icons in terminal
source ~/.local/share/icons-in-terminal/icons.fish

set IGNORE_PATHS ".git|node_modules"

starship init fish | source

echo "Hi Philip!"
