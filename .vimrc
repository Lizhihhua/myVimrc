set nocompatible   " 不和vi兼容

syntax on  " 语法高亮开启
filetype on  " 文件类型开启
filetype plugin on " 不同文件类型插件开启
filetype indent on " 不同文件类型缩进开启

" 避免中文乱码
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
set vb t_vb=   " 消除警告声
set mouse=a    " 使用鼠标
set cmdheight=1  " 命令行高度设置为1
set autoread     " 自动加载
set autowriteall " 自动写入
set incsearch    " 增强搜索功能，高亮所有匹配的字符
set ignorecase   " 忽略大小写
set showcmd      " 显示输入命令
set cursorline   " 高亮当前行
set nobackup     " 文件不备份
set noswapfile   " 取消.swap文件
set nowritebackup   "写备份但关闭vim后自动删除 
set foldmethod=manual " 启用语法折叠, zf折叠，za展开
set ambiwidth=double "防止特殊符号无法正常显示
set autoindent    " 当前格式应用到下一行
set gcr=a:block-blinkon0  " 禁止光标闪烁
set laststatus=2      " 总是底部状态栏
set t_Co=256      " 终端开启256色支持
set ruler         " 显示光标位置
set number        " 显示行号
set hlsearch      " 高亮显示搜索结果
set backspace=2   " 回退键生效
set expandtab     " 将制表符扩展为空格
set guioptions-=m  " 隐藏菜单栏
set guioptions-=T  " 顶部
set guioptions-=L  " 左
set guioptions-=r  " 右
set cindent        " C缩进
set smartindent    " 智能缩进
set shiftwidth=4   " tab, s-tab== 4空格
set softtabstop=4  "
set tabstop=4

" 和windows快捷键表现一样
source D:/ProgramFiles/Vim/vim82/mswin.vim
behave mswin

nnoremap <C-w> :set nohls<CR>   " C-w取消高亮
" o另开一行
nnoremap <CR> o<ESC>
nnoremap <tab> V>
nnoremap <s-tab> V<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
" j, 上，k下
nnoremap j k
nnoremap k j
vnoremap j k
vnoremap k j
nnoremap<C-j> <C-W>j        "ctrl + j下
nnoremap<C-k> <C-W>k        "上
nnoremap<C-h> <C-W>h        "左
nnoremap<C-l> <C-W>l        "右
nnoremap xa :xa<CR>         " xa保存所有文件并退出

" Ctrl-Z 撤销
"inoremap <c-z> <esc>u<esc>i
"vnoremap <C-z> <ESC>u
"nnoremap <C-z> <ESC>u

"保存文件按键映射
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>

" H第一个非空格字符首，L第一个非空格字符尾
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
" 避免菜单栏乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" <leader> = 空格
let mapleader = "\<space>"

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'          " molokai主题
Plug 'preservim/nerdcommenter' " leader-cc 注释，leader-cu消除注释，leader-c<space>智能添加/消除注释
Plug 'Yggdroot/indentLine'     " 分割线
Plug 'preservim/nerdtree'      " 文件树
"Plug 'Lokaltog/vim-powerline'  " 状态栏
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " coc.nvim
Plug 'octol/vim-cpp-enhanced-highlight'    " 对C++语法高亮增强
Plug 'hdima/python-syntax'     " python语法高亮
Plug 'nathanaelkane/vim-indent-guides'   " 缩进对齐显示
Plug 'majutsushi/tagbar'        " tagbar类型分类
Plug 'luochen1990/rainbow'      " 括号颜色不同
Plug 'Raimondi/delimitMate'     " 括号自动补全
Plug 'vim-airline/vim-airline'  " airline状态栏
Plug 'vim-airline/vim-airline-themes'  " airline主题
"Plug 'dense-analysis/ale'          "语法检查
call plug#end()

" powerline设置
    let g:Powerline_colorscheme='solarized256'

" molokai设置
    set background=dark
    colorscheme molokai

" F9编译, F5运行C, CPP程序
    func CompileCfamily()
        exec "w"
            if &filetype == "cpp" || &filetype == "c"
            exec "!clang++ %<.cpp -Wall -o %<.exe"
        endif
    endfunc
    func RunCode()
        exec "w"
        if &filetype == "cpp" || &filetype == "c"
            exec "!%<.exe"
        elseif &filetype == 'python'
            exec "!python %<.py"
        endif
    endfunc
    map <silent>  <F9> :call CompileCfamily() <CR>
    map <silent>  <F5> :call RunCode() <CR>

" Nerdtree设置
    let NERDTreeMinimalUI=1
    let NERDTreeWinSize=20
    " autocmd vimenter * NERDTree    " 自动开启文件树
    nmap <leader>nt :NERDTreeToggle<CR>

" indentLine设置
    let g:indentLine_enabled = 1
    let g:indentLine_conceallevel = 2
    "let g:indentLine_color_term = 255      "设置显示线为白色
    let g:indentLine_setColors = 128       " 灰色


" 设置头文件，main函数
    func SetCPPTitle()
        call setline(1, "#include <bits/stdc++.h>")
        call append(line("."), "")
        call append(line(".")+1, "using namespace std;")
        call append(line(".")+2, "")
        call append(line(".")+3, "int main() {")
        call append(line(".")+4, "")
        call append(line(".")+5, "    return 0;")
        call append(line(".")+6, "}")
    endfunc 
    func SetTitle()
        if &filetype == 'cpp'
            exec ":call SetCPPTitle()"
            exec ":$"
        endif
    endfunc
    nmap<leader>st :call SetTitle()<CR>
    au VimEnter * exec ":set noimdisable"

" 光标保持在上次退出原处
    au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else |exe "norm $"| endif | endif

" coc.nvim配置
    let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-pyright']
    set nohidden
    set nowritebackup

    set updatetime=300
    set shortmess+=c
    " [g, 前一个错误，]g后一个错误
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " <leader>d，定义，<leader>i，实现
    nmap <silent> <leader>d <Plug>(coc-definition)
    nmap <silent> <leader>D <Plug>(coc-declaration)
    nmap <silent> <leader>i <Plug>(coc-implementation)

    " K，显示预览信息
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    " 标识符重命名
    nmap <leader>rn <Plug>(coc-rename)

" <leader>cf 一键格式化代码, code format
    func! FormatSrc()
        if &filetype == 'cpp' || &filetype == 'c'
            exec 'silent !clang-format.exe -i -style="{'
                    \ .'BasedOnStyle: llvm,'
                    \ .'AlignArrayOfStructures: Left,'
                    \ .'AlignConsecutiveMacros: Consecutive,'   
                    \ .'AllowShortBlocksOnASingleLine: Empty,'
                    \ .'AllowShortFunctionsOnASingleLine: Empty,'
                    \ .'AllowShortLambdasOnASingleLine: Empty,'
                    \ .'ColumnLimit: 80,'
                    \ .'IndentWidth: 4'
                    \ .'}" %'
        endif
    endfunc
    nnoremap <leader>cf :call FormatSrc()<CR>

" tarbar设置
    let g:tagbar_compact = 1
    "当编辑代码时，在Tagbar自动追踪变量
    let g:tagbar_autoshowtag = 1
    set tags=tags;
    set autochdir
    "不开启排序,即按标签本身在文件中的位置排序
    let g:tagbar_width=20
    let g:tagbar_right=1
    let g:tagbar_sort=0  
    "<F4>作为toggle
    nmap <F4> :TagbarToggle<CR>

" ctags设置
    "手动运行ctags
    nnoremap <leader>r :!ctags -R *<CR>

" rainbow设置
    let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" delimitMate设置
    " delimitMate换行时未自动缩进，需要以下的设置才能自动缩进
    let delimitMate_expand_cr = 1      " 需要backspace包含start,eol
    let delimitMate_expand_space = 1   " 需要backspace包含start,eol

" airline设置
    let g:airline_theme='murmur' 

    "这个是安装字体后 必须设置此项" 
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline#extensions#coc#enabled = 1      " coc
    "let g:airline#extensions#ale#enabled = 1       " ale
    let g:airline#extensions#tabline#enabled = 1  " tabline
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#keymap#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1

    " let g:airline_section_b = '%{strftime("%Y/%m/%d %H:%M")}'
    let g:airline_section_c_only_filename=1
    let g:airline_section_x = airline#section#create(['filetype'])
    let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%c'])
    let g:airline_section_warning=''
    
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.colnr = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ': '
    "let g:airline_symbols.dirty='⚡' 

    " 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
    nmap <silent> <leader>1 <Plug>AirlineSelectTab1
    nmap <silent> <leader>2 <Plug>AirlineSelectTab2
    nmap <silent> <leader>3 <Plug>AirlineSelectTab3
    nmap <silent> <leader>4 <Plug>AirlineSelectTab4
    nmap <silent> <leader>5 <Plug>AirlineSelectTab5
    nmap <silent> <leader>6 <Plug>AirlineSelectTab6
    nmap <silent> <leader>7 <Plug>AirlineSelectTab7
    nmap <silent> <leader>8 <Plug>AirlineSelectTab8
    nmap <silent> <leader>9 <Plug>AirlineSelectTab9
    
    set guifont=Powerline_Consolas:h12:cANSI  " 设置字体

" ale语法检查配置
    " 始终开启标志列
    "let g:ale_sig_column_always=0
    "let g:ale_set_highlights = 0

     "错误和警告符号
    "let g:ale_sign_error = '>>'
    "let g:ale_sign_warning = '~'

     "vim自带状态栏中整合ale
    "let g:ale_statusline_format = ['XXH', '%d', 'W %d', 'OK']

     "显示linter名称，出错或警告等相关信息
    "let g:ale_echo_msg_error_str = ">>"
    "let g:ale_echo_msg_warning_str = "~"
    "let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    
     "只有保存时才进行语法检测
    "let g:ale_lint_on_text_changed = "never"
    "let g:ale_lint_on_insert_leave = 0
    "let g:ale_lint_on_enter = 1

    "nmap <Leader>en <Plug>(ale_next)         前往下一个错误
    "nmap <Leader>ep <Plug>(ale_previous)     前往上一个错误
    "nnoremap <Leader>ts :ALEToggle<CR>       开启/关闭语法检查
    "nnoremap <leader>d :ALEDetail<CR>        查看错误或警告的详细信息
    "let g:ale_linters = {
    "\   'c++': ['clang'],
    "\   'c': ['clang'],
    "\   'python': ['pylint'],
    "\}

