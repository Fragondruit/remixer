/bin/zsh

# register "python" as an env var 
sudo ln -s /usr/bin/python3 /usr/local/bin/python

# pretend that "python"'s command line dev tools are the same as "python3"'s
sudo ln -s /Library/Developer/CommandLineTools/usr/bin/python3 /Library/Developer/CommandLineTools/usr/bin/python
