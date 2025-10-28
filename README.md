### Neovim 配置概览

[init.lua](file:///home/jdh/.config/nvim/init.lua) 配置文件备份。

#### 版本和管理方式

- **Neovim** 使用 Lua 作为主要配置语言（通过 [init.lua](file:///home/jdh/.config/nvim/init.lua) 文件）。
- **插件管理器**: 使用 [packer.nvim](https://github.com/wbthomason/packer.nvim) 进行插件管理。首次运行时会自动安装 packer。
  
```lua
local ensure_packer = function()
  ...
end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  ...
end)
```

#### 已安装插件及功能整合

| 插件名称 | 功能 |
|---------|------|
| `vim-airline/vim-airline` + `vim-airline/vim-airline-themes` | 状态栏美化 |
| `folke/tokyonight.nvim` | 主题配色方案 |
| `preservim/nerdtree` | 文件浏览树 |
| `preservim/nerdcommenter` | 快速注释代码 |
| `neoclide/coc.nvim` | 代码自动补全引擎 |
| `nvim-treesitter/nvim-treesitter` | 更好的语法高亮 |
| `sheerun/vim-polyglot` | 多语言支持 |
| `lukas-reineke/indent-blankline.nvim` | 显示缩进引导线 |

##### 配色主题整合

- 当前使用的主色调为 `tokyonight`，它被应用于：
  - 编辑器整体颜色：`vim.cmd([[colorscheme tokyonight]])`
  - Airline 状态栏：`vim.g.airline_theme = "tokyonight"`

此外还引入了其他备选主题如 `morhetz/gruvbox`，可以根据喜好切换。

#### 快捷键汇总

##### 模式切换类
| 组合键 | 模式 | 描述 |
|-------|-----|------|
| `jj`, `jk`, `kj` | Insert | 返回 Normal 模式 |

##### 自动补全相关 (coc.nvim)
| 组合键 | 模式 | 描述 |
|-------|-----|------|
| `<CR>` | Insert | 回车确认选择或换行 |
| `<TAB>` | Insert | 触发或导航到下一个补全项 |
| `<S-TAB>` | Insert | 导航到上一个补全项 |
| `gd` | Normal | 跳转至定义位置 |
| `K` | Normal | 查看文档提示 |
| `<A-o>` | Normal | 显示诊断信息列表 |
| `<A-f>` | Normal / Visual | 格式化选中区域 |

##### 其他常用操作
由于配置未显示 NERDTree 或其它文件浏览器的具体按键映射，通常默认使用命令模式输入`:NERDTreeToggle`来开启/关闭文件树。

#### 拓展建议

1. **增强搜索体验**
   - 添加 [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 提供模糊查找功能，例如快速跳转文件、缓冲区、帮助文档等。

2. **Git集成**
   - 引入 [vim-fugitive](https://github.com/tpope/vim-fugitive) 或更现代的 [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)，实现 Git 命令内嵌和变更标记。

3. **启动加速优化**
   - 可加入 [ impatient.nvim ](https://github.com/lewis6991/impatient.nvim) 来缓存模块加载路径从而加快启动速度。

4. **终端集成**
   - 集成内置终端控制如 [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)，方便在 Neovim 内部运行 shell 命令。

5. **项目管理**
   - 加入 [project.nvim](https://github.com/ahmedkhalf/project.nvim) 实现项目工作区管理和自动会话恢复。

这些扩展可以进一步提升开发效率并丰富 Neovim 的生态体验。