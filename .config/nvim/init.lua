-- 1. ⚠️ 必须在最前面设置 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. 引导 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 3. 插件清单
require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  { "nvim-tree/nvim-tree.lua", tag = "compat-nvim-0.9", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("nvim-tree").setup({ view = { width = 30, side = "left" } }) end },
    
  { "akinsho/toggleterm.nvim",
    keys = { { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" } },
    config = function()
      require("toggleterm").setup({ size = 12, hide_numbers = true, shade_terminals = true, direction = "horizontal", start_in_insert = true })
    end,
  },
  
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("lualine").setup() end },
    
  { "goolord/alpha-nvim", config = function() require("alpha").setup(require("alpha.themes.dashboard").config) end },

  -- -- 右上角缩略图 minimap（暂不启用）
  -- {
  --   "wfxr/minimap.vim",
  --   build = "cargo install --locked code-minimap",
  --   init = function()
  --     vim.g.minimap_width = 10
  --     vim.g.minimap_auto_start = 1
  --     vim.g.minimap_auto_start_win_enter = 1
  --     vim.g.minimap_highlight_range = 1
  --     vim.g.minimap_highlight_search = 1
  --     vim.g.minimap_git_colors = 1
  --   end,
  -- },

  -- ✅ 新增：顶部多开文件标签栏
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",           -- 显示 buffer 标签
          separator_style = "slant",  -- 标签分隔样式：slant(斜角) / thick / thin
          show_buffer_icons = true,   -- 显示文件类型图标
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          -- 防止左侧文件树遮挡标签栏
          offsets = {
            { filetype = "NvimTree", text = "Explorer", text_align = "center" },
          },
        },
      })
    end,
  },
})

-- 4. 基础设置
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

-- 5. 快捷键映射
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

-- Bufferline 专用快捷键（可选但推荐）
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Close Buffer" })

-- 6. 外部文件变更自动刷新（类 tail -f）
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "silent! checktime",
})

-- 7. 应用主题
vim.cmd.colorscheme("catppuccin-mocha")
