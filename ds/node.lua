-- A node class. The list object will hold many of then.
--
node = {}

function node:new(value, next_node)
    local t = setmetatable(
        {value = nil, next_node = nil},
        {__index = node}
    )

    t.value = value or 0
    t.next_node = next_node or nil

    return t
end


return node

