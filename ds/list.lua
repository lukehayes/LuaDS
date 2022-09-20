--- An implementation of a Linked List.
-- @module List

local node = require("ds.node")

--- List table fields
-- @field head
-- @field tail
List = {
    head = nil,
    tail = nil
}


-----------
-- Create a new empty instance of the linked list.
--
-- @return List
function List.new()
    local t = setmetatable(
        {
        },
        {
            __index = List,
            __tostring = function() 
                return "Linked List with " .. self:getSize() .. " elements."
            end
        }
    )

    return t
end

-----------
-- Print the all of the values inside the linked list.
--
-- @return void
function List:print()
    local current = self.head
    local index = 1

    print("")
    print("List: size(" ..  self:getSize() .. ")")
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

-----------
-- Add a new node to the front of the list.
--
-- @param value The value to be added.
--
-- @return void
function List:pushFront(value)
    local temp = self.head
    self.head  = node:new(value)
    self.head.next_node = temp
end

-----------
-- Remove and return a node from the front of the list.
--
-- @return number The head element of the list.
function List:popFront()
    local node = self.head
    local next_node = self.head.next_node
    self.head = next_node

    return node.value
end

-----------
-- Remove and return a node from the back of the list.
--
-- @return number The tail element of the list.
function List:popBack()
    local current = self.head
    local counter = 0

    while current ~= nil do

        if(counter == self:getSize() - 2) then
            local next_node = current.next_node
            current.next_node = nil
            self.tail = current
            return next_node.value
        end

        current = current.next_node
        counter = counter + 1
    end
end

-----------
-- Add a new node to the back of the list.
--
-- @param value The value to be added.
--
-- @return void
function List:pushBack(value)

    local current = self.head

    if self.head == nil then
        self.head = node:new(value, nil)
        return
    end

    while current.next_node ~= nil do
        current = current.next_node
    end

    current.next_node = node:new(value, nil)
end

-----------
-- Get the number of elements inside the linked list.
--
-- @return number The number of elements inside the list.
function List:getSize()

    local current = self.head
    local size = 0

    while current ~= nil do
        size = size + 1
        current = current.next_node
    end

    return size
end

return List

