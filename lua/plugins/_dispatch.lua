local vcmd = vim.api.nvim_command
local function update_dispatch(cmd, command)
    local updt = "autocmd BufEnter *." ..
                     vim.bo['filetype'] " let b:dispatch = '" .. cmd .. " " ..
                     command .. "'"
    vcmd(updt)
end

local function dispatch_function_setup(comp, cmd, dispatch_cmd)
    update_dispatch(comp, cmd)
    local fun = table.concat({dispatch_cmd, comp, cmd}, ' ')
    vcmd(fun)
    print(fun)
end
local D = {
    run = function(comp) dispatch_function_setup(comp, 'run', 'Start') end,
    test = function(comp) dispatch_function_setup(comp, 'test', 'Start') end
}
return D
