local U = require('utils')
local D = require('mappings._dispatch')

U.apply_local_indentation(2)

D.initialize_mappings('npm')
D.map_run_file('node')
