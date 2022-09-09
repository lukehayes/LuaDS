local node = require("ds/node")
list = {}

function list:new(value)
    local t = setmetatable(
        {
            head = nil,
            size = 0
        },
        {
            __index = list,
            __tostring = function() 
                return "Linked List" 
            end
        }
    )

    t.head = node:new(value, nil)
    --t.head.next_node = node:new(100, t.head)

    return t
end

function list:print()
    local current = self.head
    while current.next_node ~= nil do
        print(current.value)
        current = current.next_node
    end
end

function list:addNodeFront(value)
    local head = self.head
    local temp = self.head
    self.head = node
    node.next_node = temp
end

function list:getSize()

    local current = self.head

    if(current ~= nil) then
        self.size = 1
    end

    while current.next_node ~= nil do
        self.size = self.size + 1
        current = current.next_node
        print("Counting")
    end

    return self.size
end

return list

