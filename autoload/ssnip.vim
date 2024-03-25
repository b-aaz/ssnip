if exists('g:loaded_ssnip')
  finish
endif
let g:loaded_ssnip=1

if !exists('g:Snipsfolder')
	let g:Snipsfolder = '~/.vim/snips/'
endif

func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
fun List_snipets (snip_dir)
	return split(globpath(a:snip_dir,'*.snp'),'\n')
endfun
fun Basename(path) 
	return fnamemodify(fnamemodify(a:path,':t'),':r')
endfun
fun Deactivate_snipets (Snipcategory_path) 
	for i in List_snipets(a:Snipcategory_path)
		execute "unabbr <buffer> " . Basename(i) 
	endfor
endfun
fun ssnip#Activate_snipets (Snipcategory) 
	for i in List_snipets(g:Snipsfolder . '/' . a:Snipcategory . '/')
		execute "iabbr <buffer> " . Basename(i) . " <Esc>:call Dosnip(\'" . i . "\')<CR>a"
	endfor
endfun
fun Offsetcur (lineoff,col)
	let l:curpos=getcurpos()
	echo l:curpos
	let l:line=l:curpos[1]+a:lineoff	
	echo l:line
	call cursor(l:line,a:col)
endfun
fun Gotosnipoffset ()
	let l:line=getline(".")
	let l:linesp=split(line)
	d
	call Offsetcur(linesp[0],linesp[1])
endfun
fun Sane_read(path) 
	let l:curpos=getcurpos()
	if l:curpos[1]=='1'
		exec '0read' . fnameescape(a:path)
	else
		-1
		exec 'read' . fnameescape(a:path)
	endif
endfun		
fun Dosnip (path)
	d
	call Sane_read(a:path)
	call Gotosnipoffset()
	call Deactivate_snipets(fnamemodify(a:path,':h'))
endfun


