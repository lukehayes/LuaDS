--- Node helper object for use in most of the data
--  structures included with this library.
-- @module Node

--- Node table fields
-- @field value The value to be stored in the node.
-- @field next_node The next node in the chain.
Node = {value = nil, next_node = nil}


-----------
-- Create a new instance of a Node object.
--
-- @param value The value to be stored in the node.
-- @param next_node The next node in the chain.
--
-- @return Node
function Node:new(value, next_node)
    local t = setmetatable(
        {},
        {__index = Node}
    )

    t.value = value or 0
    t.next_node = next_node or nil

    return t
end


return Node

