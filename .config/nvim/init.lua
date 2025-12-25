vim.opt.termguicolors = true   
vim.opt.number = true         
vim.opt.relativenumber = true 

vim.cmd.colorscheme "catppuccin-mocha"

require("nvim-web-devicons").setup() 
require("nvim-tree").setup({
  view = {
    width = 30,         
    side = "left",        
  },
})

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.cmd.colorscheme "catppuccin-mocha"

require('lualine').setup()

require("alpha").setup(require("alpha.themes.dashboard").config)


----------------------------------插件安装-------------------------------------------------
mkdir -p ~/.local/share/nvim/site/pack/plugins/start
cd ~/.local/share/nvim/site/pack/plugins/start
git clone --depth 1 https://github.com/catppuccin/nvim          # 最美皮肤
git clone --depth 1 https://github.com/nvim-lualine/lualine.nvim  # 动感底栏
git clone --depth 1 https://github.com/nvim-tree/nvim-tree.lua    # VS Code 侧边栏
git clone --depth 1 https://github.com/nvim-tree/nvim-web-devicons # 漂亮图标
git clone --depth 1 https://github.com/goolord/alpha-nvim         # 帅气启动页