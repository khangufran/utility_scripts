Add in bashrc or zshrc
```console
git clone git@github.com:khangufran/utility_scripts.git $HOME/utility_scripts
cat >>  ${HOME}/.${SHELL##*/}rc << EOF

# Utility functions and aliases from central scripts
if [ -d $HOME/utility_scripts ]; then
        for file in $HOME/utility_scripts/*sh; do
                . $file
        done
fi
EOF
. ${HOME}/.${SHELL##*/}rc

