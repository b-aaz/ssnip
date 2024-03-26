# ssnip.vim 

Simple snippet plugin for Vim .

# How it all works

All snippets are simple text files stored in a directory.
All snippets files have a '.snp' extension .
The filename (without the '.snp' at the end) is what you should type in insert
mode for the snippet to be read . 
Snippet files should be stored based on their category in directories .
All the snippet category directories are stored in a parent directory which is
by default located at `~/.vim/snips/` .
You can activate a snippet category by calling the 
`ssnip#Activate_snipets(Snipcategory)` function and passing as its argument the
name of the directory of that category .
When a category is active any of its snippets will be read if you type the
filename of that snippet in insert mode .
The category will become inactive after any of its snippets are read .
If a category is inactive typing its snippets name will do noting . 

# Installation 
# Snippet format 
The first line of a snippet file stores the cursor offset .
The first number is the line offset and the second is the column offset .

Example snippet file :
```
3 10
#include <stdio.h>
int main(void){
    puts("");
}
```
calling this snippet will insert the text and put the cursor on the X and go to
insert mode :
```
    puts(X");
```
