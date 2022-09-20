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
function Stack.new()
    local t = setmetatable(
        {},
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
-- Pop an element off of the top of the stack.
--
-- @return Node The node table at the top of the stack.
function Stack:pop()
    local head = self.head
    self.head = self.head.next_node
    return head.value
end

-----------
-- Push a new element onto the top of the stack.
--
-- @param value The value to be added.
--
-- @return Stack
function Stack:push(value)

    if not self.head then
        self.head = Node:new(value)
    else
        self.head = Node:new(value, self.head)
    end

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

-----------
-- Print the all of the values inside the linked list.
--
-- @return void
function Stack:print()
    local current = self.head
    local index = 1

    print("")
    print("Stack: size(" ..  self:getSize() .. ")")
    print("--------------")
    print("")
    while current ~= nil do
        if(index == 1) then
            print("=> " .. current.value .. " (HEAD)")
        elseif(index == self:getSize()) then
            print("=> " .. current.value .. " (TAIL)")
        else
            print("-> " .. current.value)
        end
        current = current.next_node
        index = index + 1
    end
    print("")
end


return Stack

