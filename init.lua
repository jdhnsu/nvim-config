-----------------------------------------------------------
-- 插件管理（packer）
-----------------------------------------------------------
-----------------------------------------------------------
-- 插件管理（packer）
-----------------------------------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  -- 若目录不存在，则自动克隆 packer
  if fn.empty(fn.glob(install_path)) > 0 then
    print("⏬ 正在安装 packer.nvim 到 " .. install_path)
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

    -- 手动创建目录并加载 packer
    vim.cmd("packadd packer.nvim")
    print("✅ packer 安装完成，请重新打开 Neovim")
    return true
  end

  -- 若存在则加载
  if vim.fn.isdirectory(install_path) == 1 then
    vim.cmd("packadd packer.nvim")
  end

  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  -- 插件管理器
  use "wbthomason/packer.nvim"

  -- 状态栏美化
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- 主题
  use "folke/tokyonight.nvim"
  use "morhetz/gruvbox"

  -- 文件树
  use "preservim/nerdtree"

  -- 代码注释
  use "preservim/nerdcommenter"

  -- 自动补全引擎
  use { "neoclide/coc.nvim", branch = "release" }

  -- Treesitter 语法高亮
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- 多语言支持
  use "sheerun/vim-polyglot"

  -- 缩进线（新版）
  use "lukas-reineke/indent-blankline.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-----------------------------------------------------------
-- 基础设置
-----------------------------------------------------------
local o = vim.opt

-- 编码
o.encoding = "utf-8"
o.fileencoding = "utf-8"

-- 行号
o.number = true
o.relativenumber = true

-- 缩进
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
o.smartindent = true

-- 搜索
o.ignorecase = true
o.smartcase = true

-- 外观
o.termguicolors = true
o.background = "dark"
vim.cmd("syntax enable")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- 分屏
o.splitbelow = true
o.splitright = true

-- 剪贴板
o.clipboard = "unnamedplus"

-- 透明背景
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local hl_groups = { "Normal", "NonText", "NormalNC", "SignColumn", "LineNr", "FoldColumn" }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("hi %s ctermbg=none guibg=none", name))
    end
  end,
})

-----------------------------------------------------------
-- 键位映射
-----------------------------------------------------------
vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })

-----------------------------------------------------------
-- 主题
-----------------------------------------------------------
vim.cmd([[colorscheme tokyonight]])
vim.g.airline_theme = "tokyonight"

-----------------------------------------------------------
-- coc.nvim 自动补全配置
-----------------------------------------------------------
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")

-- 回车智能补全
vim.api.nvim_set_keymap(
  "i",
  "<CR>",
  [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { noremap = true, silent = true, expr = true }
)

-- Tab 补全
vim.api.nvim_set_keymap(
  "i",
  "<TAB>",
  [[pumvisible() ? "\<C-n>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]],
  { noremap = true, silent = true, expr = true }
)
vim.api.nvim_set_keymap("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], { noremap = true, silent = true, expr = true })

_G.check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- 跳转与操作
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "K", ":lua show_docs()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-o>", ":CocList diagnostics<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-f>", "<Plug>(coc-format-selected)", { silent = true, expr = true })
vim.api.nvim_set_keymap("x", "<A-f>", "<Plug>(coc-format-selected)", { silent = true, expr = true })

function _G.show_docs()
  if vim.tbl_contains({ "vim", "help" }, vim.bo.filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  else
    vim.fn.CocActionAsync("doHover")
  end
end

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.fn.CocActionAsync("diagnosticInfo")
  end,
})

-----------------------------------------------------------
-- Treesitter 配置（自动镜像）
-----------------------------------------------------------
require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "lua", "python", "javascript", "html", "css" },
  sync_install = false,
  highlight = { enable = true },
}

-----------------------------------------------------------
-- indent-blankline (v3, ibl)
-----------------------------------------------------------
require("ibl").setup {
  indent = {
    char = "│",
  },
  scope = {
    enabled = true,
    show_start = true,
    highlight = { "Function", "Label" },
  },
  whitespace = {
    highlight = { "Whitespace" },
    remove_blankline_trail = false,
  },
}
