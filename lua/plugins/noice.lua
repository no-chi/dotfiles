return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = -9,
            col = "90%",
          },
          size = {
            width = 70,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor", -- 相对于光标
          position = {
            row = 35, -- 光标下方 1 行
            col = 7, -- 光标左侧对齐
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "none",
            padding = { 0, 1 },
          },
          --          win_options = {
          --            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          --          },
        },
      },
    },
  },
}
