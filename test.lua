package.path = "./lualib/?.lua;./sproto/?.lua;" .. package.path
package.cpath = "./luaclib/?.dll;" .. package.cpath

function filter_spec_char(s)
    local ss = {}
    local k = 1
    while true do
        if k > #s then break end
        local c = string.byte(s,k)
        if not c then break end
        if c<192 then
            if (c>=39 and c<=126) then
                table.insert(ss, string.char(c))
            end
            k = k + 1
        end
    end
    return table.concat(ss)
end

local yaml = require "yaml"
local luaTableDump = require "luaTableDump"
local fd = io.open("./lua-yaml/Game.yaml")
local a = fd:read("a")
fd:close()
-- local x = filter_spec_char(a)
-- print(a)
local c = table.pack(yaml.load(a))
print(type(c), luaTableDump(c))
