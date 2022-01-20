    " ***************** 全局设置 ************** "
     
    " 开启文件类型侦测
    filetype on
    " 根据侦测到的不同类型加载对应的插件
    filetype plugin on
    let mapleader = "\<space>"
    " 取消匹配高亮
    nnoremap <c-w> :set nohls<CR>

    " 消除警告声
    set vb t_vb=
    au GuiEnter * set t_vb=

    " 使用mswin.vim一样的快捷键
    source $VIMRUNTIME mswin.vim
    behave mswin

    " Ctrl-Z 撤销
    inoremap <c-z> <esc>u<esc>i
    vnoremap <C-z> <ESC>u
    nnoremap <C-z> <ESC>u

    " 文件不备份
    set noswapfile

    "命令行高度
    set cmdheight=1 
    
    "在当前行上添加空白行
    nnoremap <CR> o<ESC>

    "normal模式和visual模式下，tab键和shift-Tab键缩进文本，
    nnoremap <tab> V>
    nnoremap <s-tab> V<
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv

    "在normal模式和visual模式下，k, j互换
    nnoremap j k
    nnoremap k j

    vnoremap j k
    vnoremap k j

    "退出按键映射
    nnoremap xa :xa<CR>

    "保存文件按键映射
    inoremap <C-s> <ESC>:w<CR>
    nnoremap <C-s> :w<CR>

    "分割口切换
    nnoremap<C-j> <C-W>j        "ctrl + j下
    nnoremap<C-k> <C-W>k        "上
    nnoremap<C-h> <C-W>h        "左
    nnoremap<C-l> <C-W>l        "右

    
    "行首，第一个非空字符的映射
    "行末，设置为L
    nnoremap H ^
    nnoremap L $
    
    vnoremap H ^
    vnoremap L $

     "设置文件编码    
    set encoding=utf-8
    " set fileencoding=utf-8,chinese,latin-1,gbk,gb18030,gk2312
    if has("win32")
        set fileencoding=chinese
    else
        set fileencoding=utf-8
    endif
    source $VIMRUNTIME/menu.vim
    source $VIMRUNTIME/delmenu.vim
    language messages zh_CN.utf-8

   "出现乱码的解决方法
    let &t_TI = ""
    let &t_TE = ""

    "显示输入的命令
    set showcmd

    " 字体样式，大小
    set guifont=Consolas:h12 

    set autoread             "自动加载
    set autowriteall         "自动保存

    set guioptions-=m        " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
    "set guioptions-=r        " 隐藏右侧滚动条
    set guioptions-=b        " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏  
    set cursorline           " 突出显示当前行  

    " 自动缩进
    filetype indent on
    " 开启语法高亮功能
    syntax enable
    " 允许用指定语法高亮配色方案替换默认方案
    syntax on
    set incsearch "开启实时搜索功能
    set ignorecase "搜索忽略大小写
    set wildmenu "vim命令自动补全
    set autoread "文件自动更新
    set gcr=a:block-blinkon0 "禁止关闭闪烁
    set laststatus=2 "总是显示状态栏
    set ruler "显示光标位置
    set number "显示行号
    set cursorline "高亮显示当前行
    set hlsearch "高亮显示搜索结果
    set backspace=2 "回退键生效
     
    " 将制表符扩展为空格
    set expandtab
    " 基于缩进或语法进行代码折叠
    set foldmethod=syntax
    " 启动 vim 时关闭折叠代码
    set nofoldenable
    set autoindent
    
    " C, C++自动缩进
    set cindent
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4

    
   " ************** 插件管理与设置 ************ "
    " 配置vim-plug
    call plug#begin('~/.vim/plugged')
        Plug 'altercation/vim-colors-solarized'  " 主题方案
        Plug 'preservim/nerdtree'    " 文件树
        Plug 'Lokaltog/vim-powerline' "status 美化
        Plug 'octol/vim-cpp-enhanced-highlight' "对c++语法高亮增强
        Plug 'Valloric/YouCompleteMe' "自动补全
        Plug 'dense-analysis/ale'          "语法检查
        " Plug 'davidhalter/jedi-vim'   " python自动补全
        Plug 'tomasr/molokai'       " molokai主题方案
        Plug 'valloric/vim-indent-guides' " 缩进对齐显示
        Plug 'Raimondi/delimitMate'    " 括号自动补全  
        Plug 'hdima/python-syntax'     " python语法高亮
        Plug 'yggdroot/indentline'     " 显示缩进指示线
        Plug 'majutsushi/tagbar'       " tagbar类型分类
        Plug 'chun-yang/auto-pairs'    " 自动括号匹配 
        Plug 'preservim/nerdcommenter'  " 多行注释
        Plug 'https://github.com.cnpmjs.org/luochen1990/rainbow'    " 括号颜色不同
        Plug 'skywind3000/vim-keysound'  " 发出打字机的音效
        Plug 'mattn/emmet-vim'          " html补全
        " Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } " 文件搜索  
        Plug 'tpope/vim-surround'       " 修改括号
    call plug#end()

    " Powerline 设置
    " 设置状态栏主题风格
    let g:Powerline_colorscheme='solarized256'
    "let g:Powerline_symbols = 'fancy'
    "let g:Powerline_symbols = 'unicode'

    " 置颜色主题
    set background=dark
    colorscheme molokai

   "括号匹配增强设置
    let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
    let g:rbpt_max = 40
    let g:rbpt_loadcmd_toggle = 0 

   
    " YCM 补全菜单配色
    " 补全功能在注释中同样有效
    set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

    let g:ycm_error_symbol=">>"
    let g:ycm_warning_symbol =">*"
    let g:ycm_show_diagnostics_ui = 0    " 关闭语法检查
    let g:ycm_complete_in_comments=1
    let g:ycm_show_diagnostivs_ui = 1  " 开启实时错误或者warning的检测
    let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
    let g:ycm_add_preview_to_completeopt = 0        " 关闭补全预览
    " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
    let g:ycm_confirm_extra_conf=0
    " " 开启 YCM 标签补全引擎
    let g:ycm_collect_identifiers_from_tags_files=1
    " " 补全内容不以分割子窗口形式出现，只显示补全列表
    set completeopt-=preview
    " " 从第一个键入字符就开始罗列匹配项
    let g:ycm_min_num_of_chars_for_completion=1
    " " 禁止缓存匹配项，每次都重新生成匹配项
    let g:ycm_cache_omnifunc=0
    " "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1

    let g:ycm_python_interpreter_path ='D:\ProgramFiles\Python\python.exe'
    let g:ycm_pathon_sys_path = [
        \ 'D:\ProgramFiles\Python\Lib\site-packages',
        \ 'D:\ProgramFiles\Python',
        \ 'D:\ProgramFiles\Python\DLLs',
        \ 'D:\ProgramFiles\Python\Lib',
        \ 'D:\ProgramFiles\Python\Scripts'
        \]
    let g:ycm_extra_conf_vim_data = [
        \ 'g:ycm_python_interpreter_path',
        \ 'g:ycm_pathon_sys_path'
        \]
    let g:ycm_global_ycm_extra_conf = '~\.vim\plugged\YouCompleteMe\third_party\ycmd\.ycm_extra_conf.py' 
    " nnoremap <leader>] :YcmCompleter GoToDefinitionElseDeclaration<CR>
    "let g:ycm_key_list_select_completion = ['<TAB>']
    "let g:ycm_key_list_previous_completion = ['<S-TAB>']
    let g:ycm_key_list_stop_completion = ['<UP>', '<DOWN>']

    "python语法高亮
    let python_highlight_all = 1

    " ale语法检查配置
    " 始终开启标志列
    let g:ale_sig_column_always=0
    let g:ale_set_highlights = 0

    " 错误和警告符号
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '~'

    " vim自带状态栏中整合ale
    let g:ale_statusline_format = ['XXH', '%d', 'W %d', 'OK']

    " 显示linter名称，出错或警告等相关信息
    let g:ale_echo_msg_error_str = ">>"
    let g:ale_echo_msg_warning_str = "~"
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    
    " 只有保存时才进行语法检测
    let g:ale_lint_on_text_changed = "never"
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 1

    nmap <Leader>en <Plug>(ale_next)        " 前往下一个错误
    nmap <Leader>ep <Plug>(ale_previous)    " 前往上一个错误
    nnoremap <Leader>ts :ALEToggle<CR>      " 开启/关闭语法检查
    nnoremap <leader>d :ALEDetail<CR>       " 查看错误或警告的详细信息
    let g:ale_linters = {
    \   'c++': ['clang'],
    \   'c': ['clang'],
    \   'python': ['pylint'],
    \}
    " 如果是.txt文本，禁止ale插件检查，不然很卡
    " au BufNewFile,BufRead *.txt let g:ale_enabled=0
    "括号匹配设置
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    
    "批量注释设置
    " <leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
    "<leader>cu，取消选中文本块的注释。
    "<leader>c<space>, 只能判断，取消选中还是添加注释

    let NERDSpaceDelims = 1
    
    
    " 编译C，C++文件
    func CompileCfamily()
        exec "w"
        if &filetype == "cpp" || &filetype == "c"
            exec "!g++ %<.cpp -Wall -g -o %<.exe"
        endif
    endfunc
    
   "定义执行python, c, c++, javascript
    func RunCode()
        exec "w"
        if &filetype == "cpp" || &filetype == "c"
            exec "!%<.exe"
        elseif &filetype == 'python'
            exec "!python %<.py"
        elseif &filetype == 'javascript'
            exec "!node %<.js"
        endif
    endfunc

    "定义Debug函数，用来调试程序, C, C++, python
    func Debug()
    exec 'w'
    "C程序
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!gdb %<.exe"
    endif
    endfunc
    "结束定义Debug


    map <silent>  <F9> :call CompileCfamily() <CR>
    imap <silent> <F9> <ESC>:call CompileCfamily() <CR>
    vmap <silent> <F9> <ESC>:call CompileCfamily() <CR>

    map <silent>  <F5> :call RunCode() <CR>
    imap <silent> <F5> <ESC>:call RunCode() <CR>
    vmap <silent> <F5> <ESC>:call RunCode() <CR>
    
    " C++, C debug
    map <F6> :call Debug()<CR>
    imap <F6> <ESC>:call Debug()<CR>
    vmap <F6> <ESC>:call Debug()<CR>
    
    " NERDTree设置
    "去除第一行的帮助提示
    let NERDTreeMinimalUI=1
    "在左边占多宽
    let NERDTreeWinSize=20
    "打开vim时自动打开
    " autocmd vimenter * NERDTree
    " <F2>作为toggle
    nmap <leader>nt :NERDTreeToggle<CR>

    "Tagbar######################################################
    "去除第一行的帮助信息
    let g:tagbar_compact = 1
    "当编辑代码时，在Tagbar自动追踪变量
    let g:tagbar_autoshowtag = 1
    set tags=tags;
    set autochdir
    "不开启排序,即按标签本身在文件中的位置排序
    let g:tagbar_width=20
    let g:tagbar_right=1
    let g:tagbar_sort=0  
    "<F3>作为toggle
    nmap <F4> :TagbarToggle<CR>
    " 打开vim时自动打开
    " autocmd VimEnter *.cpp,*.h,*.c,*.py nested :TagbarOpen
    " wincmd l
    "如果不加这句，打开vim的时候当前光标会在Nerdtree区域
    " autocmd VimEnter * wincmd l


    "手动运行ctags
    nnoremap <leader>r :!ctags -R *<CR>

    "indentLine插件，显示缩进指示线
    let g:indentLine_enabled = 1
    "缩进显示线设置
    let g:indentLine_conceallevel = 2
    "设置显示线为白色
    "let g:indentLine_color_term = 255
    let g:indentLine_setColors = 128

    " 终端设置
    tnoremap <ESC> <c-\><c-n>     " <ESC>退出终端，回到Normal模式
    nnoremap <leader>t :rightbelow ter ++rows=5<CR>
    " auto VimEnter *.cpp,*.h,*.c,*.py exec 'rightbelow ter ++rows=5'

    " 括号颜色不同
    let g:rainbow_active = 1  


    func SetCPPTitle()
        call setline(1, "/**")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+1, "* ".strftime("%Y/%m/%d by Lizhh", localtime()))
        call append(line(".")+2, "*/")
        call append(line(".")+3, "")
        call append(line(".")+4, "")
    endfunc 
    func SetPythonTitle()
        call setline(1, "# File Name: ".expand("%"))
        call append(line(".")+, "# ".strftime("%Y/%m/%d by Lizhh", localtime()))
        call append(line(".")+1, "")
        call append(line(".")+2, "")
    endfunc

    func SetTitle()
        if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
            exec ":call SetCPPTitle()"
            exec ":$"
        elseif &filetype == 'python'
            exec ":call SetPythonTitle()"
            exec ":$"
        endif
    endfunc
    

    " au BufNewFile *.cpp,*.c,*.java,*.py nested exec ":call SetTitle()"
    nmap<leader>st :call SetTitle()<CR>
    au VimEnter * exec ":set noimdisable"

    
    " 设置Leaderf，文件搜索
    nnoremap <leader>f :LeaderfFile<CR> 

    " 配置emmet-vim
    " let g:user_emmet_mode='n'    "only enable normal mode functions.
    let g:user_emmet_mode='inv'  "enable all functions, which is equal to
    " let g:user_emmet_mode='a'    "enable all function in all mode.
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
    let g:user_emmet_leader_key='<C-y>'

    " 配置vim-keysound，让vim发出打字机的音效
    let g:keysound_enable=1
    let g:keysound_theme='typewriter'
    let g:keysound_py_version = 3   " python版本
    let g:keysound_volume = 1000     " 音量
   
