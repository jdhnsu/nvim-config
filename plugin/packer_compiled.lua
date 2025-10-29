-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/jdh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jdh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jdh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jdh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jdh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2ã\1\0\0\5\0\t\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\15\0\0\0X\2\aÄ9\2\3\0015\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3B\2\2\1K\0\1\0\nscope\1\0\2\fenabled\2\15show_start\2\vindent\1\0\0\1\0\1\tchar\b‚îÇ\nsetup\bibl\frequire\npcall\0" },
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2À\1\0\0\5\0\t\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\15\0\0\0X\2\aÄ9\2\3\0015\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3B\2\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\b\0\0\6c\bcpp\blua\vpython\15javascript\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["smear-cursor.nvim"] = {
    config = { "\27LJ\2\2á\1\0\0\4\0\6\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\15\0\0\0X\2\4Ä9\2\3\0014\3\0\0B\2\2\1X\2\3Ä6\2\4\0'\3\5\0B\2\2\1K\0\1\0%Êó†Ê≥ïÂä†ËΩΩ smear-cursor Êèí‰ª∂\nprint\nsetup\17smear_cursor\frequire\npcall\0" },
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/smear-cursor.nvim",
    url = "https://github.com/sphamba/smear-cursor.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\2Õ\2\0\0\4\0\v\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0006\2\4\0009\2\5\0029\2\6\2=\2\6\0015\2\a\0005\3\b\0=\3\t\2=\2\n\1B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\vNormal\1\0\2\rwinblend\3\0\vborder\vcurved\nshell\6o\bvim\1\0\t\20shade_terminals\2\17open_mapping\n<c-\\>\19shading_factor\3\2\18close_on_exit\2\17persist_size\2\20start_in_insert\2\14direction\15horizontal\tsize\3\20\17hide_numbers\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/jdh/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2ã\1\0\0\5\0\t\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\15\0\0\0X\2\aÄ9\2\3\0015\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3B\2\2\1K\0\1\0\nscope\1\0\2\fenabled\2\15show_start\2\vindent\1\0\0\1\0\1\tchar\b‚îÇ\nsetup\bibl\frequire\npcall\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2À\1\0\0\5\0\t\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\15\0\0\0X\2\aÄ9\2\3\0015\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3B\2\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\b\0\0\6c\bcpp\blua\vpython\15javascript\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: smear-cursor.nvim
time([[Config for smear-cursor.nvim]], true)
try_loadstring("\27LJ\2\2á\1\0\0\4\0\6\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\15\0\0\0X\2\4Ä9\2\3\0014\3\0\0B\2\2\1X\2\3Ä6\2\4\0'\3\5\0B\2\2\1K\0\1\0%Êó†Ê≥ïÂä†ËΩΩ smear-cursor Êèí‰ª∂\nprint\nsetup\17smear_cursor\frequire\npcall\0", "config", "smear-cursor.nvim")
time([[Config for smear-cursor.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\2Õ\2\0\0\4\0\v\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0006\2\4\0009\2\5\0029\2\6\2=\2\6\0015\2\a\0005\3\b\0=\3\t\2=\2\n\1B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\vNormal\1\0\2\rwinblend\3\0\vborder\vcurved\nshell\6o\bvim\1\0\t\20shade_terminals\2\17open_mapping\n<c-\\>\19shading_factor\3\2\18close_on_exit\2\17persist_size\2\20start_in_insert\2\14direction\15horizontal\tsize\3\20\17hide_numbers\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
