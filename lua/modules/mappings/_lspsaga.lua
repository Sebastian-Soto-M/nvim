local K = require('modules.mappings._helper')
local S = {}

S.lsp = {
    code_actions = function(keys)
        K.run_lua(keys, 'require("lspsaga.codeaction").code_action()')
    end,
    float_term = function(open, close)
        K.run_vim(open, 'Lspsaga open_floaterm')
        K.run_vim(close, 'Lspsaga close_floaterm')
    end,
    ---Configure hover documentation.
    ---@param launch string
    ---@param move_up string
    ---@param move_down string
    ---@param speed integer
    hover_doc = function(launch, move_up, move_down, speed)
        speed = math.abs(speed)
        K.run_lua(launch, 'require("lspsaga.hover").render_hover_doc()')
        K.run_lua(move_up,
                  "require('lspsaga.action').smart_scroll_with_saga(" .. speed ..
                      ")")
        K.run_lua(move_down,
                  "require('lspsaga.action').smart_scroll_with_saga(" .. speed *
                      -1 .. ")")
    end,
    jump_to_diagnostics = function(prev, next)
        K.run_lua(prev,
                  'require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()')
        K.run_lua(next,
                  'require("lspsaga.diagnostic").lsp_jump_diagnostic_next()')
    end,
    lsp_finder = function(keys)
        K.run_lua(keys, 'require("lspsaga.provider").lsp_finder()')
    end,
    preview_definition = function(keys)
        K.run_lua(keys, 'require("lspsaga.provider").preview_definition()')
    end,
    rename = function(keys)
        K.run_lua(keys, 'require("lspsaga.rename").rename()')
    end,
    signature_help = function(keys)
        K.run_lua(keys, 'require("lspsaga.signaturehelp").signature_help()')
    end
}

S.initialize_mappings = function ()
    S.lsp.lsp_finder('<leader>fl')
end

return S
