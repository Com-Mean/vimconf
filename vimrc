"http://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html
"https://github.com/wklken/k-vim
runtime! debian.vim
set nocompatible               " be iMproved(不与vi兼容)
filetype off                   " required!       /**  从这行开始，vimrc配置 **/
" Vundle是Vim的插件管理工具
" VundleSet{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" }

" common conf {{
syntax enable
syntax on
" 支持静态语法检查，风格检查
Bundles 'scrooloose/syntastic'
set autoindent
set backspace=2
set showmatch
set laststatus=2

set expandtab
set shiftwidth=4
set tabstop=4

set foldenable
set foldmethod=syntax  "折叠方式为依语法

set cursorline         "为光标所在行加下划线
set number             "显示行号
" set autoread         "文件在vim修改后，自动读入

set ignorecase         "检索时，忽略大小写
set hlsearch           "检索匹配项高亮

set go=
set showcmd
set cmdheight=1

" Chinese 
language messages zh_CN.utf-8
set encoding=euc-cn "utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set fileencodings=ucs-bom,utf-8,chinese,euc-jp,euc-kr,latin1
set helplang=cn             "帮助系统设置为中文

" color
Bundle 'desert.vim'
" Bundle 'desertEx'
colo desert

" }}

"键盘命令{{
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F10> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <M-F2> :tabnew<CR>  
"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be
" }}


" ctags{
" 设置ctags的快捷键为 Ctrl-F12
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" 设置ctags其他tags源
set tags+=./tags ",../inc/tags,../bxml/tags
" }

" VundleExample{{
" My Bundles here:  /* 插件配置格式 */   

" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）
" 插件的名字必须与repos上定义的一致
" repos1: https://github.com/vim-scripts
" repos2: http://vim-scripts.org/vim/scripts.html 
Bundle 'L9'
" Bundle 'FuzzyFinder'

" non github repos   (非上面两种情况的，按下面格式填写)
" Bundle 'git://git.wincent.com/command-t.git'
" ... 
" }}

" FencView{{{ 
" 水木社区的 mbbill 开发的插件使用词频统计的方式识别文件编码
Bundle 'FencView.vim'
" let g:fencview_autodetect=1 "默认开启时设置
" }}}

" SuperTab{
Bundle 'SuperTab-continued.'
let g:SuperTabRetainComletionType=2
let g:SuperTabDefaultCompletionType="context"
"<C-X><C-O>" " context,tab替换"Ctrl+X Ctrl+O"
" }

" taglist{
Bundle 'taglist.vim'
"let g:Tlist_Sort_Type = 'name'          "以名称顺序排序，默认以位置顺序(order)
let g:Tlist_Show_One_File = 1           "不同时显示多个文件的tag，只显示当前文件的
let g:Tlist_Exit_OnlyWindow = 1         "如果taglist窗口是最后一个窗口，则退出vim
let g:Tlist_File_Fold_Auto_Close = 0    "当光标不在编辑文件里面的时候全部折叠
let g:Tlist_Use_Right_Window = 1        "在右侧窗口中显示taglist窗口
"let g:Tlist_Enable_Fold_Column = 1      "显示折叠边栏
map <F3> :TlistToggle<CR>
" }

" TagHighlight 支持用户自定义的数据类型名高亮显示
Bundle 'TagHighlight'

"提供多文件同时编辑功能,操作缓存buffer窗口  
Bundle 'minibufexplorerpp'           
let g:miniBufExplMapWindowNavVim = 1 "Ctrl-<hjkl> to move to window   
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)

" NerdTree use <F2>  
Bundle 'The-NERD-tree'
let NERDTreeWinPos='right'  
let NERDTreeWinSize=25
let NERDTreeChDirMode=1
map <F2> :NERDTreeToggle<CR>  
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Winmanager{{
" http://www.cnblogs.com/ifys/archive/2010/10/24/1860610.html
Bundle 'winmanager'
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:AutoOpenWinManager = 1                  "vim启动时自动打开winmanager
let g:persistentBehaviour=0                   "exit vim if only winmanager left
let g:winManagerWidth=26                      "default 25

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

nmap wm :WMToggle<CR>
" }}

" 对cscope的支持{{ 
"暂未启用
"Bundle 'cscope-quickfix'
"设定使用 quickfix 窗口来显示 cscope 的查询结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
"切换到下一个结果
nmap <F6> :cn<cr>
"切换到上一个结果
nmap <F7> :cp<cr>
" map <F12> :call Do_CsTag()<CR>

"cscope插件：查询符号的调用和定义位置等，已经集成到vim里面，这里只是映射快捷键"<C-_>g的按法是先按"Ctrl+Shift+-", 然后很快再按"g"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>  "查找本 C 符号(可以跳过注释)
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR> "查找本定义
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> "查找调用本函数的函数
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> "查找本字符串
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> "查找本 egrep 模式
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR> "查找本文件
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> "查找包含本文件的文件
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> "查找本函数调用的函数
" }}

" cpp, python自动补全{{
Bundle 'OmniCppComplete'
"need cscope support
" 关闭omnicppcomplete预览窗口 
set completeopt=menu

" python
Bundle 'pythoncomplete'
Bundle 'kevinw/pyflakes-vim'
Bundle 'python.vim'
" }}

" Doxygen{{ use <fa> <fg> <fb> <fo>快速注释
Bundle 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="\tlpqiu@hbgk.net"
let g:DoxygenToolkit_licenseTag="Copyright (C) 2012-2014 深圳南方汉邦科技有限公司版权所有.\<enter>"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_dateTag = "\t@date\t"
let g:DoxygenToolkit_briefTag_post= "\n/// @complexity\t"
let g:DoxygenToolkit_versionTag= "\t@example\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_commentType="C++"
let g:doxygen_enhanced_color=1
"文档注释
map fa :DoxAuthor<cr>
" 函数注释
map fg :Dox<cr>  
map fb :DoxBlock<cr> " 
map fl :DoxLic<cr>
"单行注释
map fo O/** **/<Left><Left>
" }}

" TagBar,暂未使用,可用于替代taglist，功能更强
" Bundle 'Tagbar' "提供源代码符号的结构化视图,这个插件需要tags文件的支持
" Bundle 'majutsushi/tagbar'
" nmap <F4> :TagbarToggle<CR>   "设置快捷键,按下<strong>F4</strong>即可显示列表  
" let g:tagbar_autofocus = 1    
" let g:tagbar_width = 30       "设置宽度，默认为30  
" autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开tagbar  
" let g:tagbar_left = 1         "在左侧  
" let g:tagbar_right = 1        "在右侧  

" Bundle 'SuperTab'
" Bundle 'SuperTab'
" Bundle 'SuperTab'
filetype plugin indent on     " required!   /** vimrc文件配置结束 **/
"                                           /** vundle命令 **/
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo 
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"   
" see :h vundle for more details or wiki for FAQ 
" NOTE: comments after Bundle command are not allowed..

"检查ctags,cscope是否安装并设置到环境变量中 
"生成最新的cscope.out使omnicppcomplete能起效 
"check if ctags&cscope installed and added into path 
function Do_CsTag() 
    let dir = getcwd() 
    if filereadable("tags") 
        if(g:iswindows==1) 
            let tagsdeleted=delete(dir."\\"."tags") 
        else 
            let tagsdeleted=delete("./"."tags") 
        endif 
        if(tagsdeleted!=0) 
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None 
            return 
        endif 
    endif 
    if has("cscope") 
        silent! execute "cs kill -1" 
    endif 
    if filereadable("cscope.files") 
        if(g:iswindows==1) 
            let csfilesdeleted=delete(dir."\\"."cscope.files") 
        else 
            let csfilesdeleted=delete("./"."cscope.files") 
        endif 
        if(csfilesdeleted!=0) 
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None 
            return 
        endif 
    endif 
    if filereadable("cscope.out") 
        if(g:iswindows==1) 
            let csoutdeleted=delete(dir."\\"."cscope.out") 
        else 
            let csoutdeleted=delete("./"."cscope.out") 
        endif 
        if(csoutdeleted!=0) 
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None 
            return 
        endif 
    endif 
    if(executable('ctags')) 
        "silent! execute "!ctags -R --c-types=+p --fields=+S *" 
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ." 
    endif 
    if(executable('cscope') && has("cscope") ) 
        if(g:iswindows!=1) 
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files" 
        else 
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files" 
        endif 
        silent! execute "!cscope -b" 
        execute "normal :" 
        if filereadable("cscope.out") 
            execute "cs add cscope.out" 
        endif 
    endif 
endfunction 

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' && &filetype == 'python'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: lpqiu") 
        call append(line(".")+2, "\# mail: qlp_1018@126.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        if &filetype == 'sh'
            call append(line(".")+5, "\#!/bin/bash") 
            call append(line(".")+6, "") 
        else
            call append(line(".")+5, "\#!/usr/bin/python")
            call append(line(".")+6, "\# -*- coding: utf-8 -*-") 
            call append(line(".")+7, "")
        endif 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: lpqiu") 
        call append(line(".")+2, "    > Mail: lpqiu_1018@126.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C，C++ 按F5编译运行
" map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -Wall % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -Wall % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
