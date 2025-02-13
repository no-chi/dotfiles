-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local fcitx5_states = {
  insert = 1, -- 1: 输入法未激活, 2: 已激活
  cmdline = 1,
  replace = 1,
}

-- 插入模式
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if fcitx5_states.insert == 2 then
      vim.fn.system("fcitx5-remote -o")
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    fcitx5_states.insert = tonumber(vim.fn.system("fcitx5-remote"))
    vim.fn.system("fcitx5-remote -c")
  end,
})

-- 命令行模式
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    if fcitx5_states.cmdline == 2 then
      vim.fn.system("fcitx5-remote -o")
    end
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    fcitx5_states.cmdline = tonumber(vim.fn.system("fcitx5-remote"))
    vim.fn.system("fcitx5-remote -c")
  end,
})

-- 替换模式 (R)
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:R", -- 进入 R 模式时
  callback = function()
    if fcitx5_states.replace == 2 then
      vim.fn.system("fcitx5-remote -o")
    end
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "R:*", -- 退出 R 模式时
  callback = function()
    fcitx5_states.replace = tonumber(vim.fn.system("fcitx5-remote"))
    vim.fn.system("fcitx5-remote -c")
  end,
})

--按 <leader>r 开启功能。按 r 进入替换模式，输入法切换到中文。输入字符或按 ESC，输入法切换回英文。按 <leader>r 关闭功能，恢复默认行为。

-- 定义输入法切换功能的状态
local ime_switch_enabled = false
local autocmd_id = nil -- 用于存储自动命令的 ID

-- 输入法切换功能的核心逻辑
local function setup_ime_switch()
  -- 处理 r 命令（单字符替换）
  autocmd_id = vim.api.nvim_create_autocmd("User", {
    pattern = "ReplaceSingleChar",
    callback = function()
      -- 切换到中文输入法
      vim.fn.system("fcitx5-remote -o")

      -- 延迟切换回英文输入法
      vim.schedule(function()
        vim.fn.system("fcitx5-remote -c")
      end)
    end,
  })

  -- 映射 r 命令触发自定义事件
  vim.keymap.set("n", "r", function()
    -- 触发自定义事件
    vim.api.nvim_exec_autocmds("User", { pattern = "ReplaceSingleChar" })
    -- 执行默认的 r 命令
    return "r"
  end, { expr = true })
end

-- 清理输入法切换功能
local function cleanup_ime_switch()
  if autocmd_id then
    -- 删除自定义事件
    vim.api.nvim_del_autocmd(autocmd_id)
    autocmd_id = nil
  end

  -- 恢复默认的 r 命令
  vim.keymap.set("n", "r", "r", { noremap = true, silent = true })
end

-- 切换输入法功能的开关
local function toggle_ime_switch()
  if ime_switch_enabled then
    cleanup_ime_switch()
    print("输入法自动切换功能已关闭")
  else
    setup_ime_switch()
    print("输入法自动切换功能已开启")
  end
  ime_switch_enabled = not ime_switch_enabled
end

-- 设置 <leader>r 快捷键来开启和关闭这段脚本
vim.keymap.set(
  "n",
  "<leader>r",
  toggle_ime_switch,
  { noremap = true, silent = true, desc = "切换输入法自动切换功能" }
)

--为 nvim 写 lua 脚本，实现新的 vim 模式，模式名叫“飞更”，在正常模式按 <leader>r 键进入飞更模式。
--1. 按 <leader>R 进入模式
--2. 光标前后字符高亮显示，并添加数字和字母标签
--3. 按 1-9 或 a-z 移动光标
--4. 按 ESC 退出模式
local ns_id = vim.api.nvim_create_namespace("example")
local extid = vim.api.nvim_buf_set_extmark(0, ns_id, 0, 2, { hl_group = "Error" })
