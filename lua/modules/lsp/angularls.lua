local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = 'angularls'

local project_library_path = "/home/snsm/.local/share/npm/lib"
local command = {
    "ngserver", "--stdio", "--tsProbeLocations", project_library_path,
    "--ngProbeLocations", project_library_path
}

configs[server_name] = {
    default_config = {
        cmd = command,
        filetypes = {'typescript', 'html', 'typescriptreact', 'typescript.tsx'},
        root_dir = util.root_pattern('angular.json', '.git')
    },
    on_new_config = function(new_config, new_root_dir)
        -- We need to check our probe directories because they may have changed.
        new_config.cmd = command
    end
}
