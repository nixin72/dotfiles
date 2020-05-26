# Copies the file into a new file with ".bak" appended to the name
function bak
    for $arg in $argv
        cp $arg $arg".bak"
    end
end

# Re-sources the fish environment to bring in changes
function resource-fish
    cp -r ~/repos/dotfiles/.config/fish/* ~/.config/fish
    source ~/.config/fish/conf.d/omf.fish
end
alias rs="resource-fish"

# list-tree
function list-tree
    tree -a -I $IGNORE_PATHS
end
alias lr="list-tree"

# cd into a directory and list the contents
function cd-and-list
    cd $argv[1]
    ls -la
end
alias cl="cd-and-list"

# Make a directory and cd into it
function mkdir-and-cd
    mkdir $argv[1]
    cd $argv[1]
end
alias mkcd="mkdir-and-cd"

# Swaps the name of two different files
function swap-files
    mv $argv[1] $argv[1]".tmp"
    mv $argv[2] $argv[1]
    mv $argv[1]".tmp" $argv[2]
end
alias sf="swap-files"

# Remove all files 
function remove-all-except
    find . ! -name $argv[1] -type f -exec rm -rf {} +
end
alias rme="remove-all-except"
