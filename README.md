### `Vim`

#### References  
I've gleefully stripped stuff from the following people.
- [Gokul Srinivas](https://github.com/GokulSrinivas)
- [Shrayas Rajagopal](https://github.com/shrayasr)
- https://ncona.com/2013/01/configuring-vim/

#### Steps
- Copy the contents of the Vim directory to the home directory of the user.
- Vim reads `.vimrc` from the home directory. It sets the run time path to autoload
vim-plug (a plugin manager).
- The plugs are installed in `~/.vim/plugins`. 
- A common path helps as it can be easily replicated and used by Windows, Linux and
the git subsytem's vim on Windows.
