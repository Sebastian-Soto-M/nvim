local I = require('theme.icons')
require('lspkind').init({
    with_text = true,
    symbol_map = {
        Text = I.lsp.text,
        Method = I.lsp.method,
        Function = I.lsp.func,
        Constructor = I.lsp.constructor,
        Variable = I.lsp.variable,
        Class = I.lsp.class,
        Interface = I.lsp.interface,
        Module = I.lsp.module,
        Property = I.lsp.property,
        Unit = I.lsp.unit,
        Value = I.lsp.value,
        Enum = I.lsp.enum,
        Keyword = I.lsp.keyword,
        Snippet = I.lsp.snippet,
        Color = I.lsp.color,
        File = I.lsp.file,
        Folder = I.lsp.folder,
        EnumMember = I.lsp.enumMember,
        Constant = I.lsp.constant,
        Struct = I.lsp.struct
    }
})
