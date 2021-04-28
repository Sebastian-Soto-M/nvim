local gl = require('galaxyline')
local colors = { -- Colors
  bg = '#21222C',
  fg = '#F8F8F2',
  section_bg = '#282A36',
  yellow = '#F4F99D',
  cyan = '#9AEDFE',
  green = '#50FA7B',
  orange = '#FFB86C',
  blue = '#BD93F9',
  magenta = '#FF79C6',
  red = '#FF5555'
  
}

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui'}

local separatorIconUp = ""
local separatorIconDown = ""

local function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end
    
local checkMediumWidth = function()
    return has_width_gt(40)
end

    
local checkSmallWidth = function()
    return has_width_gt(35)
end

local mode_color = function()
    local mode_colors = {
        n = colors.cyan,
        i = colors.green,
        c = colors.orange,
        V = colors.magenta,
        [''] = colors.red,
        v = colors.blue,
        R = colors.red
    }

    local color = mode_colors[vim.fn.mode()]

    if color == nil then color = colors.red end

    return color
end

gls.left[1] = {
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
            if alias_mode == nil then alias_mode = vim.fn.mode() end
            return '▊ ' .. alias_mode .. ' '
        end,
        highlight = {colors.bg, colors.bg},
        separator = separatorIconDown,
        separator_highlight = {colors.bg, colors.section_bg}
    }
}

gls.left[2] = {
    Whitespace = {
        provider = function() return ' ' end,
    }
}

gls.left[3] = {
    FileSize = {
        condition = condition.buffer_not_empty and checkSmallWidth,
        highlight = {colors.orange, 'NONE'},
        provider = 'FileSize',
        separator = separatorIconUp,
        separator_highlight = {colors.bg, colors.section_bg}
    }
}

gls.left[4] = {
    LineInfo = {
        condition = condition.buffer_not_empty and checkSmallWidth,
        highlight = {colors.fg, colors.bg},
        provider = 'LineColumn',
    }
}

gls.left[5] = {
    FileIcon = {
        condition = condition.buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon_color,
            colors.bg
        },
        provider = 'FileIcon'
    }
}

gls.left[6] = {
    FileName = {
        condition = condition.buffer_not_empty,
        highlight = {colors.magenta, colors.bg },
        provider = {'FileName'}
    }
}

gls.left[7] = {
    LspClient = {
        condition = checkMediumWidth,
        highlight = {colors.yellow, colors.bg, 'italic'},
        provider = 'GetLspClient',
        separator = " ",
        separator_highlight = {colors.red, colors.bg}
    }
}

gls.left[8] = {
    DiagnosticError = {
        highlight = {colors.red, colors.bg},
        icon = '  ',
        provider = 'DiagnosticError'
    }
}

gls.left[9] = {
    DiagnosticWarn = {
        highlight = {colors.yellow, colors.bg},
        icon = '  ',
        provider = 'DiagnosticWarn'
    }
}

gls.left[10] = {
    DiagnosticHint = {
        highlight = {colors.cyan, colors.bg},
        icon = '  ',
        provider = 'DiagnosticHint'
    }
}

gls.left[11] = {
    DiagnosticInfo = {
        highlight = {colors.cyan, colors.bg},
        icon = '  ',
        provider = 'DiagnosticInfo'
    }
}

-- Right side
gls.right[1] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkSmallWidth,
        icon = '+',
        highlight = {colors.green, colors.bg}
    }
}

gls.right[2] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkSmallWidth,
        icon = '~',
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[3] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkSmallWidth,
        icon = ' ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[4] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}

gls.right[5] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[6] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.middlegrey, colors.bg}
    }
}

gls.right[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ' .. separatorIconUp,
        separator_highlight = {colors.blue, colors.bg, 'bold'},
        highlight = {colors.bg, colors.blue}
    }
}

-- Short Line
gls.short_line_left[1] = {
    BufferType = {
        highlight = {colors.cyan, colors.bg, 'bold'},
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        condition = condition.buffer_not_empty,
        highlight = {colors.fg, colors.bg, 'bold'},
        provider = 'SFileName'
    }
}

gls.short_line_right[1] = {
    BufferIcon = {provider = 'BufferIcon', highlight = {colors.fg, colors.bg}}
}
