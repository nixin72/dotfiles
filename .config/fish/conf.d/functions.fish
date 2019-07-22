function backup
    # Copies the file into a new file with ".bak" appended to the name
    cp $argv[1] $argv[1]".bak"
end

function rs
    # Re-sources the fish environment to bring in changes
    cp -r ~/repos/dotfiles/.config/fish ~/.config/fish
    source ~/.config/fish/conf.d/omf.fish
end

function cdl
    cd $argv[1]
    ls -la
end

function mdc
    mkdir $argv[1]
    cd $argv[1]
end

function swap-files
    # Swaps the name of two different files
    mv $argv[1] $argv[1]".tmp"
    mv $argv[2] $argv[1]
    mv $argv[1]".tmp" $argv[2]
end

# Adds all files to git, commits the changes, pushes to a branch.
function acp
    set com $argv[1]
    set branch $argv[2]

    echo "Commit message: $com"
    echo "Branch name: $branch"

    if test -e ./package.json
        npm version patch --no-git-tag-version -f
    end

    git add .
    git commit -m "$com"
    git push origin $branch
end

# Adds all files to git, commits the changes, pulls from a branch and pushes back to it.
function acpp
    set com $argv[1]
    set branch $argv[2]

    echo "Commit message: $com"
    echo "Branch name: $branch"

    if test -e ./package.json
        npm version patch --no-git-tag-version -f
    end

    git add .
    git commit -m "$com"
    git pull origin $branch
    git push origin $branch
end
