--- An implementation of the Stack data structure.
-- @module Stack
local node = require("ds.node")

local Stack = {
    head = nil
}

-----------
-- Create a new empty instance of a Stack.
--
-- @return Stack
function Stack:new()
    local t = setmetatable(
        {
        },
        {
            __index = Stack,
            __tostring = function() 
                return "Stack with " .. self:getSize() .. " elements."
            end
        }
    )

    return t
end

-----------
-- Push a new element onto the stop of the stack.
--
-- @param value The value to be added.
--
-- @return Stack
function Stack:push(value)

    local current = self.head
    local chain = nil

    if not self.head.next_node then
        chain = self.head.next_node
    end

    if not current then
        self.head = Node:new(value)
    else
        while current do
            current = current.next_node
            self.head = Node:new(value, chain)
        end

    end

    local next_node = self.head.next_node
    self.head = Node:new(value, self.head.next_node)
end

-----------
-- Get the number of elements inside stack.
--
-- @return number The number of elements inside the stack.
function Stack:getSize()

    local current = self.head
    local size = 0

    while current ~= nil do
        size = size + 1
        current = current.next_node
    end

    return size
end

return Stack

