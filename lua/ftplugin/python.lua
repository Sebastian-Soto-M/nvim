local U = require('utils')
local D = require('mappings._dispatch')

U.apply_local_indentation(4)

D.initialize_mappings('pymake')
D.map_run_file('python')

