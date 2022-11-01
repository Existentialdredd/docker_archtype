local pyright = require('lspconfig').pyright

local pyright_local_config = PyrightBaseConfig
local target_table = pyright_local_config.settings.python.analysis.extraPaths
local target_member_table = MemberTable(target_table)

--Function Wrapper
local insert_table_no_duplicates = function (root, extensions)
    return TabelInsertNoDuplicates(root, extensions, target_table, target_member_table)
end

--Root Setup
local venv_root = '/Users/ericpe'
local project_root = '/Users/ericpe/Desktop/projects'
local submodule_root = project_root .. '<submodule_root>'
local forket_module_root = project_root .. '<forked_module_root>'

--Insertions
local venvs = {}
insert_table_no_duplicates(venv_root, venvs)
local submodules = {}
insert_table_no_duplicates(submodule_root, submodules)
local forked_modules = {}
insert_table_no_duplicates(forket_module_root, forked_modules)

--Finish Setup
pyright.setup(pyright_local_config)
