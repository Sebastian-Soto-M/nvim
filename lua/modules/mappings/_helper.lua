local K = {}
local C = {env = {buffer = "b", global = "g"}, lang = {lua = "l", vim = "v"}}

---@param env string
---@return function
local function get_set_keymap_fun(env,...)
    if env == C.env.buffer then return vim.api.nvim_buf_set_keymap(bufnr, ...) end
    return vim.api.nvim_set_keymap(...)
end
-- | String value | Help page     | Affected modes                           | Vimscript equivalent |
-- | -----------: | ------------- | ---------------------------------------- | ---------------------|
-- | `''`         | `mapmode-nvo` | Normal, Visual, Select, Operator-pending | `:map`               |
-- | `'n'`        | `mapmode-n`   | Normal                                   | `:nmap`              |
-- | `'v'`        | `mapmode-v`   | Visual and Select                        | `:vmap`              |
-- | `'s'`        | `mapmode-s`   | Select                                   | `:smap`              |
-- | `'x'`        | `mapmode-x`   | Visual                                   | `:xmap`              |
-- | `'o'`        | `mapmode-o`   | Operator-pending                         | `:omap`              |
-- | `'!'`        | `mapmode-ic`  | Insert and Command-line                  | `:map!`              |
-- | `'i'`        | `mapmode-i`   | Insert                                   | `:imap`              |
-- | `'l'`        | `mapmode-l`   | Insert, Command-line, Lang-Arg           | `:lmap`              |
-- | `'c'`        | `mapmode-c`   | Command-line                             | `:cmap`              |
-- | `'t'`        | `mapmode-t`   | Terminal                                 | `:tmap`              |
local function map(mode, keys, action, opts, env)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    get_set_keymap_fun(env, mode, keys, action, options)
end

local function run_cmd(mode, keys, action, env, lang, enter)
    local options = {noremap = true, silent = false}
    local prefix = ":"
    if lang == C.lang.lua then prefix = prefix .. "lua " end
    action = prefix .. action
    if enter == nil then 
        action = action .. '<CR>'
        options.silent = true
    end
    get_set_keymap_fun(env, mode, keys, action, options)
end

function K.term(keys, action, opts) map('t', keys, action, opts, C.env.global) end
function K.normal(keys, action, opts) map('n', keys, action, opts, C.env.global) end
function K.insert(keys, action, opts) map('i', keys, action, opts, C.env.global) end
function K.visual(keys, action, opts) map('v', keys, action, opts, C.env.global) end

function K.run_lua(keys, action, enter)
    run_cmd('n', keys, action, C.env.global, C.lang.lua, enter)
end
function K.run_vim(keys, action, enter)
    run_cmd('n', keys, action, C.env.global, C.lang.vim, enter)
end

function K.run_vim_buf(mode, keys, action)
    run_cmd(mode, keys, action, C.env.buffer, C.lang.vim)
end
function K.run_lua_buf(mode, keys, action)
    run_cmd(mode, keys, action, C.env.buffer, C.lang.lua)
end

return K
