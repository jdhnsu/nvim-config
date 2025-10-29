-----------------------------------------------------------
-- 自动安装 packer.nvim（插件管理器）
-----------------------------------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    print("⏬ 正在安装 packer.nvim ...")
    fn.system({
      "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    })
    vim.cmd("packadd packer.nvim")
    print("✅ packer 安装完成，请重启 Neovim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-----------------------------------------------------------
-- 插件列表
-----------------------------------------------------------
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- 🌈 界面美化
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "folke/tokyonight.nvim"
  use "morhetz/gruvbox"

  -- 📁 文件树
  use "preservim/nerdtree"

  -- 💬 代码注释
  use "preservim/nerdcommenter"

  -- ⚙️ 自动补全（强大）
  use { "neoclide/coc.nvim", branch = "release" }

  -- 🌳 Treesitter 语法高亮
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        configs.setup {
          ensure_installed = { "c", "cpp", "lua", "python", "javascript", "html", "css" },
          sync_install = false,
          highlight = { enable = true },
        }
      end
    end,
  }

  -- 📄 多语言语法支持
  use "sheerun/vim-polyglot"

  -- 🧱 indent-blankline（新版）
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local ok, ibl = pcall(require, "ibl")
      if ok then
        ibl.setup {
          indent = { char = "│" },
          scope = { enabled = true, show_start = true },
        }
      end
    end,
  }

  -- -- 📝 Markdown 支持增强
  -- use {
  --   "preservim/vim-markdown",
  --   ft = "markdown",
  --   requires = { "godlygeek/tabular" },
  --   config = function()
  --     vim.g.vim_markdown_folding_disabled = 1
  --     vim.g.vim_markdown_conceal = 0
  --     vim.g.vim_markdown_conceal_code_blocks = 0
  --     vim.g.vim_markdown_frontmatter = 1
  --     vim.g.vim_markdown_auto_insert_bullets = 0
  --     vim.g.vim_markdown_new_list_item_indent = 0
  --   end,
  -- }

  -- 💻 toggleterm（终端）
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = { border = "Normal", background = "Normal" },
        },
      }
    end,
  }

    -- 🖱️ Smear Cursor 插件
 use {
  "sphamba/smear-cursor.nvim",
  config = function()
    local ok, smear_cursor = pcall(require, "smear_cursor")
    if ok then
      smear_cursor.setup {
        cursor_color = "DABA789F",
      }
    else
      print("无法加载 smear-cursor 插件")
    end
  end,
}


  -- ...existing code...
  if packer_bootstrap then
    require("packer").sync()
  end
end)


-----------------------------------------------------------
-- 基础设置
-----------------------------------------------------------
local o = vim.opt
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

-- 启动时透明背景
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
-- coc.nvim 智能补全配置
-----------------------------------------------------------
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")

-- 回车补全
vim.api.nvim_set_keymap(
  "i",
  "<CR>",
  [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { noremap = true, silent = true, expr = true }
)

-- Tab 补全
_G.check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

vim.api.nvim_set_keymap(
  "i",
  "<TAB>",
  [[pumvisible() ? "\<C-n>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]],
  { noremap = true, silent = true, expr = true }
)
vim.api.nvim_set_keymap(
  "i",
  "<S-TAB>",
  [[pumvisible() ? "\<C-p>" : "\<C-h>"]],
  { noremap = true, silent = true, expr = true }
)

-- 跳转和文档
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "K", ":lua show_docs()<CR>", { silent = true })

function _G.show_docs()
  if vim.tbl_contains({ "vim", "help" }, vim.bo.filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  else
    vim.fn.CocActionAsync("doHover")
  end
end

-----------------------------------------------------------
-- 完成！
-----------------------------------------------------------
print("✨ Neovim 配置加载成功！")
