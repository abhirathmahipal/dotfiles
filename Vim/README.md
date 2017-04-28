Things to remember when I use vim for the best possible experience.
Also remember to make changes to this file whenever I make changes to my .vimrc
I should quickly be able to come to speed if I need help getting familiar with my
configuration.


### Navigation

#### Easy Motion
- <leader><leader><movement key like w, k, j etc>
- Eg:- \\w gives a one key reach solution for all w's possible
- Eg:- \\f5 gives one key jumps to all the 5's on the current line

#### Some Keys to Remember
Some key bindings apart from what I commonly use  
- 105G  Go to line number 105.
- <C - g> Total number of lines and ratio of current cursor to total lines.

### Switching Tabs, Buffers, Windows etc

#### Switch or open Buffers, Files etc
#### Most Recent Buffer
- Switch to most recent buffer <leader>e
- Will be used a lot. Eg:- Copying parameters from model to controller and cross file
references.

#### Switch to another Buffer
- Switch to next buffer <leader>n. Keep pressing this combo to go to the next buffer.
- Open up buffer list. Enter a number or partial name to open the relevant
buffer - <leader>b. To be on the safer side you can even enter a name and press 
tab to make use of autocomplete to ensure you get the right match.


#### Switch Tabs
Avoid using tabs. They aren't the Vim way of doing things. Tabs in vim don't mean
the tabs you see on other editors. If you've forgotten what tabs are please read 
about them to gain context.
- Next Tab  Ctrl + PgUp 
- Prev Tab  Ctrl + PgDown



### General Tasks
- Select All (Taken from Shrayas) Ctrl + a
- Run programs -  Map the F5 key when I'm working on extended periods of time on a
project. Say I'm working with Python or C, map F5 manually for that session. Perhaps
I would map it to `! gcc % -o a.out`  
- :shell - opens up a shell where I can execute commands. I can use the shell as long
as I want. If I want to return to vim just exit the shell. (exit command on Bash, 
similar command of Windows and Gvim as well)

#### Comments
Using a plugin for this. Quite handy. Normally on Visual Studio code or Sublime I
would just `ctrl + /`.
- Comment
- Sexy syntax
- Comment undo
- Multiline comments for the block selected

#### Tabularise Data
Using a plugin to easily beautify code. Specify the line numbers in the command or
apply `:Tabularize` in Visual mode.
