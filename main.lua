local list = require("ds/list")
local node = require("ds/node")

local l = list:new(1)
l:pushFront(2)
l:pushFront(3)
l:pushFront(4)
l:pushBack(555)

--for i = 1,10 do
    --l:pushFront(i* 100)
--end

l:print()

--print(l.head.value)
--print(l.head.next_node.value
--print(l.head.next_node.next_node.value
