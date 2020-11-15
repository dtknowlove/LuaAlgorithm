require 'hashtable'

print('Hello world!');

function sum2num(numbs, target)
    for i = 1, #numbs - 1, 1 do
        for j = i + 1, #numbs, 1 do
            if numbs[i] + numbs[j] == target then
                return i, j
            end
        end
    end
end

function sum2numfast(numbs, target)
    hashtable = HashTable:new(10);
    for i = 1, #numbs, 1 do
        if hashtable:get(target - numbs[i]) ~= nil then
            return hashtable:get(target - numbs[i]).value, i;
        else
            hashtable:add({
                key = numbs[i],
                value = i
            });
        end
    end
end

-- print(sum2numfast({11, 6, 1, 1, 8, 7}, 9));

function isVaild(s)
    stack = {}
    mapper = {
        ['{'] = '}',
        ['('] = ')',
        ['['] = ']'
    }
    for i = 1, #s do
        if mapper[string.sub(s, i, i)] ~= nil then
            stack[#stack + 1] = string.sub(s, i, i)
        else
            right = table.remove(stack, #stack)
            if mapper[right] ~= string.sub(s, i, i) then
                return false
            end
        end
    end
    if #stack > 0 then
        return false
    end
    return true
end

-- print(isVaild('{(){}[]}'));

function trapWater(heights)
    if #heights == 0 then
        return 0
    end
    leftMax = 0
    rightMax = 0
    left = 1
    right = #heights
    area = 0
    while left <= right do
        if leftMax < rightMax then
            if heights[left] < leftMax then
                area = area + leftMax - heights[left]
            else
                leftMax = heights[left]
            end
            left = left + 1
        else
            if heights[right] < rightMax then
                area = area + rightMax - heights[right]
            else
                rightMax = heights[right]
            end
            right = right - 1
        end
    end
    return area
end

-- print(trapWater({0,1,0,2,1,0,1,3,2,1,2,1}))