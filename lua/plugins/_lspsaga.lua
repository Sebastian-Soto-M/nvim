local saga = require 'lspsaga'
local colors = require('modules.theme.colors').dracula
local K = require('modules.mappings._helper')

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 100,
        virtual_text = false
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {quit = '<Esc>', exec = '<CR>'},
    rename_action_keys = {
        quit = '<Esc>',
        exec = '<CR>' -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "round",
    rename_prompt_prefix = ''
}

---Set colors of the highlight groups
---@param hl string
---@param guifg string
---@param guibg string
---@param gui string
local function set_colors(hl, guifg, guibg, gui)
    local command = "highlight link " .. hl .. " guifg='" .. guifg ..
                        "' guibg='" .. guibg .. "'"
    -- if gui ~= nil then
    --     command = command .. " gui='".. gui .. "'"
    -- end
    vim.cmd(command)
end

local function initialize_colors()
    set_colors('LspSagaFinderSelection', colors.green, colors.yellow, 'bold')
    set_colors('LspFloatWinNormal', colors.green, colors.yellow, 'bold')
    set_colors('LspFloatWinBorder', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaBorderTitle', colors.green, colors.yellow, 'bold')
    set_colors('TargetWord', colors.green, colors.yellow, 'bold')
    set_colors('ReferencesCount', colors.green, colors.yellow, 'bold')
    set_colors('DefinitionCount', colors.green, colors.yellow, 'bold')
    set_colors('TargetFileName', colors.green, colors.yellow, 'bold')
    set_colors('DefinitionIcon', colors.green, colors.yellow, 'bold')
    set_colors('ReferencesIcon', colors.green, colors.yellow, 'bold')
    set_colors('ProviderTruncateLine', colors.green, colors.yellow, 'bold')
    set_colors('SagaShadow', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaFinderSelection', colors.green, colors.yellow, 'bold')
    set_colors('DiagnosticTruncateLine', colors.green, colors.yellow, 'bold')
    set_colors('DiagnosticError', colors.green, colors.yellow, 'bold')
    set_colors('DiagnosticWarning', colors.green, colors.yellow, 'bold')
    set_colors('DiagnosticInformation', colors.green, colors.yellow, 'bold')
    set_colors('DiagnosticHint', colors.green, colors.yellow, 'bold')
    set_colors('DefinitionPreviewTitle', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaShTruncateLine', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaDocTruncateLine', colors.green, colors.yellow, 'bold')
    set_colors('LineDiagTuncateLine', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaCodeActionTitle', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaCodeActionTruncateLine', colors.green, colors.yellow,
               'bold')
    set_colors('LspSagaCodeActionContent', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaRenamePromptPrefix', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaRenameBorder', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaHoverBorder', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaSignatureHelpBorder', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaCodeActionBorder', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaAutoPreview', colors.green, colors.yellow, 'bold')
    set_colors('LspSagaDefPreviewBorder', colors.green, colors.yellow, 'bold')
    set_colors('LspLinesDiagBorder', colors.green, colors.yellow, 'bold')
end