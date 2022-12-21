local C = require('settings.config').THEME.colors
local I = require('theme.icons')
local condition = require('galaxyline.condition')
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui'}

local separatorIconUp = I.separators.up
local separatorIconDown = I.separators.down

local function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

local checkMediumWidth = function() return has_width_gt(40) end

local checkSmallWidth = function() return has_width_gt(35) end

local spaceIcon = function(icon) return ' ' .. icon .. ' ' end

local mode_color = function()
    local mode_colors = {
        n = C.cyan,
        i = C.green,
        c = C.orange,
        V = C.magenta,
        [''] = C.red,
        v = C.blue,
        R = C.red
    }

    local color = mode_colors[vim.fn.mode()]

    if color == nil then color = C.red end

    return color
end

gls.left = {
    {
        ViMode = {
            provider = function()
                local alias = {
                    n = 'NORMAL',
                    i = 'INSERT',
                    c = 'COMMAND',
                    V = 'VISUAL-LINE',
                    [''] = 'VISUAL-BLOCK',
                    v = 'VISUAL',
                    R = 'REPLACE'
                }
                vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color())
                local alias_mode = alias[vim.fn.mode()]
                if alias_mode == nil then
                    alias_mode = vim.fn.mode()
                end
                return '▊ ' .. alias_mode .. ' '
            end,
            highlight = {C.bg, C.bg},
            separator = separatorIconDown,
            separator_highlight = {C.bg, C.section_bg}
        }
    }, {Whitespace = {provider = function() return ' ' end}}, {
        FileSize = {
            condition = condition.buffer_not_empty and checkSmallWidth,
            highlight = {C.orange, 'NONE'},
            provider = 'FileSize',
            separator = separatorIconUp,
            separator_highlight = {C.bg, C.section_bg}
        }
    }, {
        LineInfo = {
            condition = condition.buffer_not_empty and checkSmallWidth,
            highlight = {C.fg, C.bg},
            provider = 'LineColumn'
        }
    }, {
        FileIcon = {
            condition = condition.buffer_not_empty,
            highlight = {
                require('galaxyline.provider_fileinfo').get_file_icon_color,
                C.bg
            },
            provider = 'FileIcon'
        }
    }, {
        FileName = {
            condition = condition.buffer_not_empty,
            highlight = {C.magenta, C.bg},
            provider = {'FileName'}
        }
    }, {
        DiagnosticError = {
            highlight = {C.red, C.bg},
            icon = spaceIcon(I.diagnostics.error),
            provider = 'DiagnosticError'
        }
    }, {
        DiagnosticWarn = {
            highlight = {C.yellow, C.bg},
            icon = spaceIcon(I.diagnostics.warning),
            provider = 'DiagnosticWarn'
        }
    }, {
        DiagnosticHint = {
            highlight = {C.cyan, C.bg},
            icon = spaceIcon(I.diagnostics.hint),
            provider = 'DiagnosticHint'
        }
    }, {
        DiagnosticInfo = {
            highlight = {C.cyan, C.bg},
            icon = spaceIcon(I.diagnostics.info),
            provider = 'DiagnosticInfo'
        }
    }
}

-- Right side
gls.right = {
    {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = checkSmallWidth,
            icon = spaceIcon(I.git.add),
            highlight = {C.green, C.bg}
        }
    }, {
        DiffModified = {
            provider = 'DiffModified',
            condition = checkSmallWidth,
            icon = spaceIcon(I.git.change),
            highlight = {C.orange, C.bg}
        }
    }, {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = checkSmallWidth,
            icon = spaceIcon(I.git.delete),
            highlight = {C.red, C.bg}
        }
    }, {
        Space = {
            provider = function() return ' ' end,
            highlight = {C.section_bg, C.bg}
        }
    }, {
        GitIcon = {
            provider = function() return spaceIcon(I.git.symbol) end,
            condition = condition.check_git_workspace,
            highlight = {C.blue, C.bg}
        }
    }, {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            highlight = {C.middlegrey, C.bg}
        }
    }, {
        PerCent = {
            provider = 'LinePercent',
            separator = ' ' .. separatorIconUp,
            separator_highlight = {C.blue, C.bg, 'bold'},
            highlight = {C.bg, C.blue}
        }
    }
}

gls.short_line_left = {
    {
        BufferType = {
            highlight = {C.cyan, C.bg, 'bold'},
            provider = 'FileTypeName',
            separator = ' ',
            separator_highlight = {'NONE', C.bg}
        }
    }, {
        FileIcon = {
            condition = condition.buffer_not_empty,
            highlight = {
                require('galaxyline.provider_fileinfo').get_file_icon_color,
                C.bg
            },
            provider = 'FileIcon'
        }
    }, {
        FileName = {
            condition = condition.buffer_not_empty,
            highlight = {C.magenta, C.bg},
            provider = {'FileName'}
        }
    }
}

