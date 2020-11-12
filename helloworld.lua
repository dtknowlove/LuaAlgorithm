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

print(sum2numfast({11, 6, 1, 1, 8, 7}, 9));

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

