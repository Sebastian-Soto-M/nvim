-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/sebastiansotom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/sebastiansotom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/sebastiansotom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/sebastiansotom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/sebastiansotom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/codi.vim",
    url = "https://github.com/metakirby5/codi.vim"
  },
  ["comfortable-motion.vim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/comfortable-motion.vim",
    url = "https://github.com/yuttie/comfortable-motion.vim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  dracula = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://github.com/dracula/vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim",
    url = "https://github.com/eddyekofo94/gruvbox-flat.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  indentLine = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["python-snippets"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/python-snippets",
    url = "https://github.com/cstrap/python-snippets"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/sql.nvim",
    url = "https://github.com/tami5/sql.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim",
    url = "https://github.com/fannheyward/telescope-coc.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Start", "Focus", "Make" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-markdown-toc"] = {
    commands = { "GenTocMarked" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-sayonara",
    url = "https://github.com/mhinz/vim-sayonara"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-sort-motion",
    url = "https://github.com/christoomey/vim-sort-motion"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vscode-javascript",
    url = "https://github.com/xabikos/vscode-javascript"
  },
  ["vscode-python-snippet-pack"] = {
    loaded = true,
    path = "/Users/sebastiansotom/.local/share/nvim/site/pack/packer/start/vscode-python-snippet-pack",
    url = "https://github.com/ylcnfrht/vscode-python-snippet-pack"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GenTocMarked lua require("packer.load")({'vim-markdown-toc'}, { cmd = "GenTocMarked", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'goyo.vim', 'vim-markdown', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'goyo.vim', 'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType aux ++once lua require("packer.load")({'vimtex'}, { ft = "aux" }, _G.packer_plugins)]]
vim.cmd [[au FileType fd ++once lua require("packer.load")({'vimtex'}, { ft = "fd" }, _G.packer_plugins)]]
vim.cmd [[au FileType blg ++once lua require("packer.load")({'vimtex'}, { ft = "blg" }, _G.packer_plugins)]]
vim.cmd [[au FileType brf ++once lua require("packer.load")({'vimtex'}, { ft = "brf" }, _G.packer_plugins)]]
vim.cmd [[au FileType cls ++once lua require("packer.load")({'vimtex'}, { ft = "cls" }, _G.packer_plugins)]]
vim.cmd [[au FileType dtx ++once lua require("packer.load")({'vimtex'}, { ft = "dtx" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/sebastiansotom/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
