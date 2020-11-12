require 'bit32'

HashTable = {}

function HashTable:new(c)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.arraycount = c
    self.Array = {};
    return o
end

function HashTable:add(keypair)
    keypair.key = tostring(keypair.key);
    _hash = self.BKDRHash(keypair.key)
    index = _hash % self.arraycount;
    if index > self.arraycount then
        print('beyond array length error');
        return
    end
    if self.Array[index] == nil then
        self.Array[index] = keypair;
    else
        exsit = self:getLinkNode(self.Array[index], keypair.key)
        if exsit == nil then
            self.Array[index].next = keypair;
        end
    end
end

function HashTable:get(key)
    if key == nil then
        return nil
    end
    key = tostring(key)
    _hash = self.BKDRHash(key)
    index = _hash % self.arraycount;
    if index > self.arraycount then
        print('beyond array length error');
        return nil
    end
    return self:getLinkNode(self.Array[index], key);
end

function HashTable:remove(key)
    if key == nil then
        return
    end
    key = tostring(key)
    _hash = self.BKDRHash(key)
    index = _hash % self.arraycount;
    if index > self.arraycount then
        print('beyond array length error');
        return
    end
    self:removeLinkNode(index, key);
end

function HashTable:getLinkNode(keypair, key)
    if keypair == nil then
        return nil
    end
    if keypair.key == key then
        return keypair
    else
        self.getLinkNode(keypair.next, key);
    end
end

function HashTable:removeLinkNode(index, key)
    keypair = self.Array[index];
    if keypair == nil then
        return
    elseif keypair.key == key then
        print('remove', index);
        self.Array[index] = keypair.next;
    else
        self:removeLinkNodeItem(keypair, key);
    end
end

function HashTable:removeLinkNodeItem(keypair, key)
    if keypair.next == nil then
        return
    elseif keypair.next.key == key then
        print('remove next.next');
        keypair.next = keypair.next.next;
    else
        self:removeLinkNodeItem(keypair.next, key);
    end
end

function HashTable:Clear()
    self.Array = {}
end

function HashTable.BKDRHash(str)
    seed = 131
    hash = 0
    counter = 1;
    while counter <= #str do
        hash = hash * seed + string.byte(string.sub(str, counter, counter));
        counter = counter + 1;
    end
    return bit32.band(hash, 0x7FFFFFFF);
end

-- print(HashTable.BKDRHash('11fafefa1111abedh'))
