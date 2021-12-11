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

### Notes/Reminders

- I predominantly use bash and find it easier to paste everything in `.bashrc` rather than having `.profile` as well.
- If in doubt read
  - https://unix.stackexchange.com/questions/476593/when-should-i-use-bashrc-and-when-profile
  - https://stackoverflow.com/a/902959/5698202
  - https://stackoverflow.com/a/902959/5698202
