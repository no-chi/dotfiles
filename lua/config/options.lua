-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 设置 leader 键为空格
vim.g.mapleader = " "

-- 启用行号
vim.opt.number = true

-- 启用相对行号
vim.opt.relativenumber = true

-- 高亮当前行
vim.opt.cursorline = true

-- 启用语法高亮
vim.cmd("syntax on")

-- 启用文件类型检测和插件
vim.cmd("filetype plugin indent on")

-- 设置缩进
vim.opt.tabstop = 4 -- 一个 Tab 显示为 4 个空格
vim.opt.shiftwidth = 4 -- 自动缩进时使用 4 个空格
vim.opt.expandtab = true -- 将 Tab 转换为空格
vim.opt.autoindent = true -- 自动缩进

-- 启用鼠标支持
vim.opt.mouse = "a"

-- 启用系统剪贴板支持
vim.opt.clipboard = "unnamedplus"

-- 搜索设置
vim.opt.ignorecase = true -- 忽略大小写
vim.opt.smartcase = true -- 如果搜索包含大写字母，则区分大小写
vim.opt.hlsearch = true -- 高亮搜索结果
vim.opt.incsearch = true -- 实时搜索

-- 自动换行
vim.opt.wrap = true

-- 启用持久撤销（保存撤销历史）
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- 设置撤销文件保存路径

-- 设置编码
vim.opt.fileencoding = "utf-8"

-- 启用自动保存
vim.opt.autowrite = true

-- 设置折行显示
vim.opt.linebreak = true

-- 启用状态栏
vim.opt.laststatus = 2

-- 设置命令行高度
vim.opt.cmdheight = 1

-- 设置滚动时保留的行数
vim.opt.scrolloff = 8

-- 启用终端真彩色支持
vim.opt.termguicolors = true

-- 设置自动补全行为
vim.opt.completeopt = "menuone,noselect"

-- 禁用备份文件
vim.opt.backup = false
vim.opt.swapfile = false

-- 设置自动读取外部文件更改
vim.opt.autoread = true

-- 设置折叠方式
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- 设置默认 shell
vim.opt.shell = "bash"

-- 设置默认文件浏览器
vim.g.netrw_banner = 0 -- 禁用顶部横幅
vim.g.netrw_liststyle = 3 -- 使用树形列表
vim.g.netrw_browse_split = 4 -- 在新标签页中打开文件
