package.path = "./lualib/?.lua;./sproto/?.lua;" .. package.path
package.cpath = "./luaclib/?.dll;" .. package.cpath
local yaml = require "yaml"
local fd = io.open("./lua-yaml/json.yaml")
local a = fd:read("a")
fd:close()
local c = yaml.load(a)
print(c)
