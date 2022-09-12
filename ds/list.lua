local node = require("ds/node")
list = {}

function list:new()
    local t = setmetatable(
        {
            head = nil,
            tail = nil,
        },
        {
            __index = list,
            __tostring = function() 
                return "Linked List" 
            end
        }
    )

    return t
end

-----------
-- Print the all of the values inside the linked list.
--
-- @return void
function list:print()
    local current = self.head
    local index = 1

    print("List: size(" ..  self:getSize() .. ")")
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
end

-----------
-- Add a new node to the front of the list.
--
-- @param The value to be added to the linked list.
--
-- @return void
function list:pushFront(value)
    local temp = self.head
    self.head  = node:new(value)
    self.head.next_node = temp
end

-----------
-- Remove and return a node from the front of the list.
--
-- @return number
function list:popFront()
    local node = self.head
    local next_node = self.head.next_node
    self.head = next_node

    return node.value
end

-----------
-- Remove and return a node from the front of the list.
--
-- @return number
function list:popBack()

    -- TODO Implementation half way there.
    -- returns tail but doesn't remove it yet.
    local current = self.head
    local temp    = self.head
    local sz      = self:getSize()
    local prev_index   = sz - 1
    local prev_node = self.head
    local counter = 0

    while current ~= nil do

        if(current.next_node == nil) then
            self.tail = current
        end
        
        if(counter == sz - 1) then
            prev_node = current
            self.tail = prev_node
            return current.next_node.value
        end

        current = current.next_node
        counter = counter + 1
    end
end

-----------
-- Add a new node to the back of the list.
--
-- @param The value to be added to the linked list.
--
-- @return void
function list:pushBack(value)

    local current = self.head

    while current.next_node ~= nil do
        current = current.next_node
    end

    current.next_node = node:new(value, nil)
end

-----------
-- Get the number of elements inside the linked list.
--
-- @return number
function list:getSize()

    local current = self.head

    if(current ~= nil) then
        self.size = 1
    end

    while current.next_node ~= nil do
        self.size = self.size + 1
        current = current.next_node
    end

    return self.size
end

return list

