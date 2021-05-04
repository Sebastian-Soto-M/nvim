local saga = require 'lspsaga'
local colors = require('modules.theme.colors').dracula
local I = require('modules.theme.icons')
local S = {}
local K = require"modules.mappings._helper"

S.init = function ()
    saga.init_lsp_saga {
        use_saga_diagnostic_sign = true,
        error_sign = I.diagnostics.error,
        warn_sign = I.diagnostics.warning,
        hint_sign = I.diagnostics.hint,
        infor_sign = I.diagnostics.info,
        dianostic_header_icon = I.bug,
        code_action_icon = I.light_bulb .. ' ',
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 100,
            virtual_text = false
        },
        finder_definition_icon = I.arrows.right,
        finder_reference_icon = I.arrows.right,
        max_preview_lines = 15, -- preview lines of lsp_finder and definition preview
        finder_action_keys = {
            open = '<CR>',
            vsplit = 'v',
            split = 'x',
            quit = '<Esc>',
            scroll_down = '<C-f>',
            scroll_up = '<C-b>' -- quit can be a table
        },
        code_action_keys = {quit = '<Esc>', exec = '<CR>'},
        rename_action_keys = {
            quit = '<Esc>',
            exec = '<CR>' -- quit can be a table
        },
        definition_preview_icon = I.diagnostics.info,
        -- "single" "double" "round" "plus"
        border_style = "round",
        rename_prompt_prefix = I.edit
    }
end

---Set colors of the highlight groups
---@param hl string
---@param guifg string
---@param guibg string
---@param gui string
local function set_colors(hl, guifg, guibg, gui)
    local command = "hi " .. hl .. " guifg='" .. guifg .. "' guibg='" ..
                        guibg .. "'"
    if gui ~= nil then command = command .. " gui='" .. gui .. "'" end
    vim.api.nvim_command(command)
end

S.initialize_colors = function()
    set_colors('LspSagaFinderSelection', colors.magenta, colors.yellow)
    set_colors('LspFloatWinNormal', colors.magenta, colors.yellow)
    set_colors('LspFloatWinBorder', colors.magenta, colors.yellow)
    set_colors('LspSagaBorderTitle', colors.magenta, colors.yellow)
    set_colors('TargetWord', colors.magenta, colors.yellow)
    set_colors('ReferencesCount', colors.magenta, colors.yellow)
    set_colors('DefinitionCount', colors.magenta, colors.yellow)
    set_colors('TargetFileName', colors.magenta, colors.yellow)
    set_colors('DefinitionIcon', colors.magenta, colors.yellow)
    set_colors('ReferencesIcon', colors.magenta, colors.yellow)
    set_colors('ProviderTruncateLine', colors.magenta, colors.yellow)
    set_colors('SagaShadow', colors.magenta, colors.yellow)
    set_colors('LspSagaFinderSelection', colors.magenta, colors.yellow)
    set_colors('DiagnosticTruncateLine', colors.magenta, colors.yellow)
    set_colors('DiagnosticError', colors.magenta, colors.yellow)
    set_colors('DiagnosticWarning', colors.magenta, colors.yellow)
    set_colors('DiagnosticInformation', colors.magenta, colors.yellow)
    set_colors('DiagnosticHint', colors.magenta, colors.yellow)
    set_colors('DefinitionPreviewTitle', colors.magenta, colors.yellow)
    set_colors('LspSagaShTruncateLine', colors.magenta, colors.yellow)
    set_colors('LspSagaDocTruncateLine', colors.magenta, colors.yellow)
    set_colors('LineDiagTuncateLine', colors.magenta, colors.yellow)
    set_colors('LspSagaCodeActionTitle', colors.magenta, colors.yellow)
    set_colors('LspSagaCodeActionTruncateLine', colors.magenta, colors.yellow)
    set_colors('LspSagaCodeActionContent', colors.magenta, colors.yellow)
    set_colors('LspSagaRenamePromptPrefix', colors.magenta, colors.yellow)
    set_colors('LspSagaRenameBorder', colors.magenta, colors.yellow)
    set_colors('LspSagaHoverBorder', colors.magenta, colors.yellow)
    set_colors('LspSagaSignatureHelpBorder', colors.magenta, colors.yellow)
    set_colors('LspSagaCodeActionBorder', colors.magenta, colors.yellow)
    set_colors('LspSagaAutoPreview', colors.magenta, colors.yellow)
    set_colors('LspSagaDefPreviewBorder', colors.magenta, colors.yellow)
    set_colors('LspLinesDiagBorder', colors.magenta, colors.yellow)
end

return S
