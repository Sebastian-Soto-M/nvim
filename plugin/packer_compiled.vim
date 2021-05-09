" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

time("Luarocks path setup", true)
local package_path_str = "/home/snsm/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/snsm/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/snsm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/snsm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/snsm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["context.vim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/context.vim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  dracula = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/dracula"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    after = { "vim-lua-format" },
    commands = { "Format" },
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  gruvbox = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/gruvbox"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  indentLine = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvim-bufferline.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-snippets"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/python-snippets"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-lua-format"] = {
    load_after = {
      ["formatter.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/vim-lua-format"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  ["vscode-python-snippet-pack"] = {
    loaded = true,
    path = "/home/snsm/.local/share/nvim/site/pack/packer/start/vscode-python-snippet-pack"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-web-devicons
time("Config for nvim-web-devicons", true)
try_loadstring("\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time("Config for nvim-web-devicons", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType cls ++once lua require("packer.load")({'vimtex'}, { ft = "cls" }, _G.packer_plugins)]]
vim.cmd [[au FileType dtx ++once lua require("packer.load")({'vimtex'}, { ft = "dtx" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'goyo.vim', 'vim-table-mode'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType brf ++once lua require("packer.load")({'vimtex'}, { ft = "brf" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown', 'goyo.vim', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType blg ++once lua require("packer.load")({'vimtex'}, { ft = "blg" }, _G.packer_plugins)]]
vim.cmd [[au FileType fd ++once lua require("packer.load")({'vimtex'}, { ft = "fd" }, _G.packer_plugins)]]
vim.cmd [[au FileType aux ++once lua require("packer.load")({'vimtex'}, { ft = "aux" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /home/snsm/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim", true)
vim.cmd [[source /home/snsm/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time("Sourcing ftdetect script at: /home/snsm/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim", false)
time("Sourcing ftdetect script at: /home/snsm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", true)
vim.cmd [[source /home/snsm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time("Sourcing ftdetect script at: /home/snsm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
