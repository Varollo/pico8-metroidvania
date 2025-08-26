local POS_INF = 32767.99999
local NEG_INF = -32767.99999

function print_table(table, indent)
    indent = indent or "" .. "  "
    for k, v in pairs(table) do
        if type(v) == "table" then
            print(indent .. "[" .. k .. "]: ")
            print_table(v, indent .. "  ")

        elseif type(v) == "function" then
            print(indent .. "[" .. k .. "]: function()")
        
        else
            print(indent .. "[" .. k .. "]: " .. tostr(v))
        end
    end
end