# ssnip.vim 

Simple snippet plugin for Vim .

## How it all works

- All snippets are simple text files stored in a directory.
- All snippets files have a '.snp' extension .
- The filename (without the '.snp' at the end) is what you should type in insert
mode for the snippet to be read . 
- Snippet files should be stored based on their category in directories .
- All the snippet category directories are stored in a parent directory which is
by default located at `~/.vim/snips/` .
- You can activate a snippet category by calling the 
`ssnip#Activate_snipets(Snipcategory)` function and passing as its argument the
name of the directory of that category .
- When a category is active any of its snippets will be read if you type the
filename of that snippet in insert mode .
- The category will become inactive after any of its snippets are read .
- If a category is inactive typing its snippets name will do noting . 

## Installation 
Use a plugin manager like [vim-plug](https://github.com/junegunn/vim-plug) and see their instructions .
## Usage 
You can call the `ssnip#Activate_snipets()` function with a mapping or an
abbreviation .

```vim
autocmd FileType c iabbr <buffer> ss C snipet?<C-o>:call ssnip#Activate_snipets('csnips')<CR>
```

Including this line in your .vimrc will create an insert mode abbreviation `ss`
for the snippet category `csnips` only if the Vim buffer file type is `c` .
Now if you open a `.c` file and type in `ss` it will activate all the snippets
in the `csnips` directory .

You can also create a "global" insert mode abbreviation for the snippets that
don't belong to an specific category or language (like licence notices) .

```vim
iabbr <buffer> sg Global snipet?<C-o>:call ssnip#Activate_snipets('globalsnips')<CR>
```

The directory structure of the "snips" folder will look like this :

```
~/.vim/snips/
├─ globalsnips/
│   ├─ n.snp        # blank snipet to deactivate the category easily
│   ├─ mit.snp      # MIT licence 
│   ├─ bsd.snp      # BSD licence
│   ├─ cnot.snp     # Copywrite notice
│   └─ gpl.sn       # GPL licencep
│   
└─ csnips/
    ├─ n.snp        # blank snipet to deactivate the category easily
    ├─ incs.c       # Commen C includes
    └─ c.snp        # Generic C file with inclueds and minimal includes 
```

It is advised to add a `n.snp` or `no.snp` blank snippet to easily deactivate 
the category if you mistakenly activated it .

## Snippet format 
The first line of a snippet file stores the cursor offset .
The first number is the line offset and the second is the column offset .

Example snippet file :
```C
3 10
#include <stdio.h>
int main(void){
    puts("");
}
```
calling this snippet will insert the text and put the cursor on the X and go to
insert mode :

```C
    puts(X");
```

This is a blank snippet that will do nothing :

```
0 0
```
