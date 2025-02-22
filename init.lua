-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.im-switch")
require("config.appearance")

--为 nvim 写 lua 脚本，实现新的 vim 模式，模式名叫“飞更”，在正常模式按 <leader>r 键进入飞更模式。
--1. 按 <leader>R 进入模式
--2. 光标前后字符高亮显示，并添加数字和字母标签
--3. 按 1-9 或 a-z 移动光标
--4. 按 ESC 退出模式
