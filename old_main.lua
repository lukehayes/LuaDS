local tree = {left = {}, right = {}}

function node(value, next_node)
    local node = {
        value = value,
        next_node = next_node,
    }

    node.__tostring = function() return "Node Value " .. node.value end

    return node
end

local list = {head = nil}

function listAddNodeFront(list, node)
    local temp = list.head
    list.head = node
    node.next_node = temp
end

function listAddNodeEnd(list, node)
    local head = list.head
    local current = list.head

    while current.next_node ~= nil do
        current = current.next_node
    end

    current.next_node = node
end


local a = node(1,nil)
local b = node(2,a)
local c = node(3,b)
local d = node(4,c)
local e = node(5,d)
local f = node(6,e)

list.head = f

listAddNodeFront(list, node(777))
listAddNodeFront(list, node(99))
listAddNodeEnd(list, node(1001))
listAddNodeEnd(list, node(22))

function pList(list)
    local current = list.head
    while current.next_node ~= nil do
        print(current.value)
        current = current.next_node
        if(current.next_node == nil) then
            print(current.value)
        end
    end
end

pList(list)
