HeapTable = {}

function HeapTable:new()
    o = o or {}
    setmetatable(o, self)
    self.__index = self
end

function HeapTable:push(val)
    node = {}
    node.value = val;
end

function HeapTable:pop(val)
end

function HeapTable:pushItem(node)
    if self.root == nil then
        self.root = node;
    else
        
    end
end
