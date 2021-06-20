local U = require('utils')
local D = require('mappings._dispatch')

D.set_dispatch('py', 'pymake')
D.initialize_mappings()
U.apply_local_indentation(4)
