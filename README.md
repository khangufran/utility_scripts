Add in bashrc or zshrc
if [ -d $HOME/utility_scripts ]; then
        for file in $HOME/utility_scripts/*sh; do
                . $file
        done
fi

