# Path to Oh My Fish install.
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set -x PATH ~/.local/bin $PATH
source ~/.config/fish/conf.d/functions.fish
source ~/.config/fish/conf.d/aliases.fish

echo "Hi Philip!"
