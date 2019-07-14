set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1                                                  
let g:AutoPairsShortcutBackInsert = '<M-b>'
" 状态栏
Plugin 'Lokaltog/vim-powerline.git'
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
set encoding=utf8

" 文件夹浏览器
Plugin 'scrooloose/nerdtree'

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1

let NERDTreeWinSize=31
let NERDTreeChDirMode=2
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'

"let g:NERDTreeChDirMode = 2
"let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"设置ctrlp的窗口位置
 let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'

Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1
"
"使用：  
"  \cc 注释当前行和选中行  
"  \cn 没有发现和\cc有区别  
"  \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作  
"  \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释  
"  \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释  
"  \cs 添加性感的注释，代码开头介绍部分通常使用该注释  
"  \cy 添加注释，并复制被添加注释的部分  
"  \c$ 注释当前光标到改行结尾的内容  
"  \cA 跳转到该行结尾添加注释，并进入编辑模式  
"  \ca 转换注释的方式，比如： /**/和//  
"  \cl \cb 左对齐和左右对其，左右对其主要针对/**/  
"  \cu 取消注释 


" 缩进线
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
"let g:indentLine_char = '︙'
let g:indentLine_char = '¦'
let g:indentLine_color_dark = 2 " (default: 2)
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0
let g:indentLine_enabled = 0


"模式搜索工具
Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"模糊匹配搜索工具
"Give it a shot!  :call incsearch#call(incsearch#config#fuzzy#make())
Plugin 'haya14busa/incsearch-fuzzy.vim'
map zf/ <Plug>(incsearch-fuzzy-/)
map zf? <Plug>(incsearch-fuzzy-?)
map zfg/ <Plug>(incsearch-fuzzy-stay)

"搜索与easymotion的结合
"Give it a shot!  :call incsearch#call(incsearch#config#easymotion#make())
Plugin 'haya14busa/incsearch-easymotion.vim'
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>f/ incsearch#go(<SID>config_easyfuzzymotion())

"快速移动插件
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader><Leader>a <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>a <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

":help easymotion.txt

"tag侧边栏插件
Plugin 'majutsushi/tagbar'
"设置tagbar使用的ctags的插件,必须要设置对
"let g:tagbar_ctags_bin='/usr/bin/ctags'
"设置tagbar的窗口宽度
let g:tagbar_width=30
"设置tagbar的窗口显示的位置,为左边
let g:tagbar_left=0

"
"" 6 syntastic
"Plugin 'vim-syntastic/syntastic'
"let g:syntastic_fortran_compiler='ifort'
""let g:syntastic_cpp_compiler='icpc'
"let g:syntastic_cpp_compiler='clang++'
""let g:syntastic_cpp_compiler='/usr/local/bin/bak/g++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11'
"let g:syntastic_cuda_nvcc_args=' -arch=sm_35'
"let g:syntastic_error_symbol='x'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=1
"let g:syntastic_enable_highlighting=1
"let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
"let g:syntastic_rust_checkers=['rustc'] " 使用pyflakes,速度比pylint快
"let g:syntastic_javascript_checkers = ['jsl', 'jshint']
"let g:syntastic_html_checkers=['tidy', 'jshint']
"let g:syntastic_cpp_checkers=['clang_check','gcc'] " 使用
"let g:syntastic_go_checkers=['go', 'gofmt', 'govet'] " 使用
"" 修改高亮的背景色, 适应主题
"highlight SyntasticErrorSign guifg=white guibg=black
"
"" to see error location list
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_loc_list_height = 5
"function! ToggleErrors()
"    let old_last_winnr = winnr('$')
"    lclose
"    if old_last_winnr == winnr('$')
"        " Nothing was closed, open syntastic error location panel
"        Errors
"    endif
"endfunction
"nnoremap <Leader>s :call ToggleErrors()<cr>
"nnoremap <Leader>c :SyntasticCheck<cr>
"nnoremap <Leader>r :SyntasticReset<cr>
""map <F4> :SyntasticToggleMode<CR>


"Plugin 'fatih/vim-go'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'
" #####YouCompleteMe Configure 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_max_diagnostics_to_display = 200

" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"let g:ycm_error_symbol = 'xx'
"let g:ycm_warning_symbol = '>>'
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2     " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1        " 语法关键字补全
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>        "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>        "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:clang_user_options='|| exit 0'
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <leader>f :YcmCompleter FixIt<CR>
" #####YouCompleteMe Configure 

" ###ultisnips####
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader>p"
let g:UltiSnipsListSnippets="<Leader>l"

let g:UltiSnipsUsePythonVersion = 3

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" ###ultisnips####

" ###deoplete####
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" ###deoplete####


Plugin 'terryma/vim-multiple-cursors'
nnoremap <F2> :MultipleCursorsFind <C-R>/<CR>
vnoremap <F2> :MultipleCursorsFind <C-R>/<CR>

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-rsi'

Plugin 'inkarkat/vim-ingo-library'

Plugin 'inkarkat/vim-mark'

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

Plugin 'iamcco/mathjax-support-for-mkdp'

Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = ""
" path to the chrome or the command to open chrome(or other modern browsers)
" if set, g:mkdp_browserfunc would be ignored

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" callback vim function to open browser, the only param is the url to open

let g:mkdp_auto_start = 0
" set to 1, the vim will open the preview window once enter the markdown
" buffer

let g:mkdp_auto_open = 0
" set to 1, the vim will auto open preview window when you edit the
" markdown file

let g:mkdp_auto_close = 1
" set to 1, the vim will auto close current preview window when change
" from markdown buffer to another buffer

let g:mkdp_refresh_slow = 0
" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor

let g:mkdp_command_for_global = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
" or
" let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
nmap <silent> <F5> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F5> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F6> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F6> <Plug>StopMarkdownPreview    " for insert mode


Plugin 'google/yapf', { 'rtp': 'plugins/vim' }

" let g:formatter_yapf_style = 'google'
autocmd FileType python nnoremap <Leader><Leader>= :0,$!yapf<CR>
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>


Plugin 'python-mode/python-mode'
"python-mode
"开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 129
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
"使用python3
" let g:pymode_python = 'python3'
"使用PEP8风格的缩进
let g:pymode_indent = 1
"取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1
"启用python-mode内置的python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
let g:pymode_virtualenv = 1
"不使用python-mode运行python代码
let g:pymode_run = 1
let g:pymode_run_bind = '<Leader>rr'
"不使用python-mode设置断点
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
"启用python语法检查
let g:pymode_lint = 1
"修改后保存时进行检查
let g:pymode_lint_on_write = 1
"编辑时进行检查
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"发现错误时不自动打开QuickFix窗口
let g:pymode_lint_cwindow = 1
"侧边栏不显示python-mode相关的标志
let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
let g:pymode_rope = 1
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
let g:pymode_rope_show_doc_bind = '<C-c>d'
"项目修改后重新生成缓存
let g:pymode_rope_regenerate_on_write = 1
"开启补全，并设置<C-Tab>为默认快捷键
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
let g:pymode_rope_rename_bind = '<C-c>rr'
"重命名光标下的模块或包
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           foldmarker setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fdm=marker
"set fdm=indent
" set foldmarker=!>v,!<^
:highlight Folded ctermfg=4 ctermbg=0

"au! BufRead,BufNewFile *.f90 set foldmarker=!>v,!<^
"
"au! BufRead,BufNewFile *.c      set foldmarker=//>v,//<^
"au! BufRead,BufNewFile *.cpp    set foldmarker=//>v,//<^
"au! BufRead,BufNewFile *.h      set foldmarker=//>v,//<^
"au! BufRead,BufNewFile *.cuh    set foldmarker=//>v,//<^
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 屏蔽掉讨厌的F1键
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" 光标移动到文件关闭时的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 插入模式
set pastetoggle=<F12>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"edited
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8 fileencodings=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      display setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
color desert
"colorscheme evening
"color ron

set number

syntax on

"set paste
"set noautoindent

"set ic
" Cursorline Highlight
set cursorline 
" Highlight cursorline to be bold rather than underline
hi CursorLine term=bold cterm=bold guibg=DarkGrey

":imap <Tab> <C-N>

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 不要高亮被搜索的句子（phrases）
set hlsearch
map <Space> :nohl<cr>

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
"set incsearch

" 输入:set list命令是应该显示些啥？
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
"set list

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=8

" 不要闪烁
"set novisualbell

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime("%d/%m/%y\ -\ %H:%M")}

" 总是显示状态行
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
"set cindent

" 制表符为4
set tabstop=4

" 统一缩进为4
"set softtabstop=4
set shiftwidth=4


" 不要用空格代替制表符
set expandtab
"set noexpandtab

" 不要换行
set nowrap

" 在行和段开始处使用制表符
"set smarttab




filetype plugin on
filetype indent on
autocmd FileType go compiler go



"打开文件自动 打开tagbar
"filetype on
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"映射tagbar的快捷键
nmap <F8> :TagbarToggle<CR>
"nmap <F8> :TagbarToggle<CR>
":TagbarOpen fj
":TagbarClose
"nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
inoremap <F1> :<C-u>nohlsearch<CR>
nnoremap <F1> :<C-u>nohlsearch<CR>
vnoremap <F1> :<C-u>nohlsearch<CR>

"设置鼠标开关快捷键
map <F10> :set mouse =a<CR>                                                                                                                                                 
map <F11> :set mouse -=a<CR>
imap <F10> <C-O>:set mouse =a<CR>
imap <F11> <C-O>:set mouse -=a<CR>

"set backspace=2
set backspace=indent,eol,start

