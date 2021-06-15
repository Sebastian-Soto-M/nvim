local U = {}

function U.apply_options(opts) for k, v in pairs(opts) do vim.opt[k] = v end end

function U.apply_globals(globals) for k, v in pairs(globals) do vim.g[k] = v end end

local C = {env = {buffer = "b", global = "g"}, lang = {lua = "l", vim = "v"}}

---@param env string
---@return function
local function get_set_keymap_fun(env, ...)
    if env == C.env.buffer then
        return vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    return vim.api.nvim_set_keymap(...)
end

local function map(mode, keys, action, opts, env)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    get_set_keymap_fun(env, mode, keys, action, options)
end

local function run_cmd(mode, keys, action, lang, env, enter)
    local options = {noremap = true, silent = false}
    local prefix = ":"
    if lang == C.lang.lua then prefix = prefix .. "lua " end
    action = prefix .. action
    if env == nil then env = C.env.global end
    if enter == nil then
        action = action .. '<CR>'
        options.silent = true
    end
    get_set_keymap_fun(env, mode, keys, action, options)
end

---@param mode string
---@param keys string
---@param action string
---@param opts table
function U.map_global(mode, keys, action, opts)
    map(mode, keys, action, opts, C.env.global)
end

---# Environments
---**"b"** for buffer or **"g"** for global
--- ___
---# Modes
-- | String value | Vimscript equivalent | Affected modes                           | Help page       |
-- | :----------: | :------------------: | :--------------------------------------: | :-------------: |
-- | **''**       | **:map**             | Normal, Visual, Select, Operator-pending | **mapmode-nvo** |
-- | **'n'**      | **:nmap**            | Normal                                   | **mapmode-n**   |
-- | **'v'**      | **:vmap**            | Visual and Select                        | **mapmode-v**   |
-- | **'s'**      | **:smap**            | Select                                   | **mapmode-s**   |
-- | **'x'**      | **:xmap**            | Visual                                   | **mapmode-x**   |
-- | **'o'**      | **:omap**            | Operator-pending                         | **mapmode-o**   |
-- | **'!'**      | **:map!**            | Insert and Command-line                  | **mapmode-ic**  |
-- | **'i'**      | **:imap**            | Insert                                   | **mapmode-i**   |
-- | **'l'**      | **:lmap**            | Insert, Command-line, Lang-Arg           | **mapmode-l**   |
-- | **'c'**      | **:cmap**            | Command-line                             | **mapmode-c**   |
-- | **'t'**      | **:tmap**            | Terminal                                 | **mapmode-t**   |
---@param mode string
---@param keys string
---@param action string
---@param enter boolean
---@param env string
function U.run_lua(mode, keys, action, enter, env)
    run_cmd(mode, keys, action, C.lang.lua, env, enter)
end

---# Environments
---**"b"** for buffer or **"g"** for global
--- ___
---# Modes
-- | String value | Vimscript equivalent | Affected modes                           | Help page       |
-- | :----------: | :------------------: | :--------------------------------------: | :-------------: |
-- | **''**       | **:map**             | Normal, Visual, Select, Operator-pending | **mapmode-nvo** |
-- | **'n'**      | **:nmap**            | Normal                                   | **mapmode-n**   |
-- | **'v'**      | **:vmap**            | Visual and Select                        | **mapmode-v**   |
-- | **'s'**      | **:smap**            | Select                                   | **mapmode-s**   |
-- | **'x'**      | **:xmap**            | Visual                                   | **mapmode-x**   |
-- | **'o'**      | **:omap**            | Operator-pending                         | **mapmode-o**   |
-- | **'!'**      | **:map!**            | Insert and Command-line                  | **mapmode-ic**  |
-- | **'i'**      | **:imap**            | Insert                                   | **mapmode-i**   |
-- | **'l'**      | **:lmap**            | Insert, Command-line, Lang-Arg           | **mapmode-l**   |
-- | **'c'**      | **:cmap**            | Command-line                             | **mapmode-c**   |
-- | **'t'**      | **:tmap**            | Terminal                                 | **mapmode-t**   |
---@param mode string
---@param keys string
---@param action string
---@param enter boolean
---@param env string
function U.run_vim(mode, keys, action, enter, env)
    run_cmd(mode, keys, action, C.lang.vim, env, enter)
end

function U.save_all()
    local gls = require('galaxyline')
    gls.section.mid[1] = {
        Text = {
            provider = function() return 'Saved all files' end,
            highlight = {C.fg, C.bg}
        }
    }
end

return U
