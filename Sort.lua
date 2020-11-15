-- Bubble
function sortBubble(array)
    length = #array
    if length == 0 or length == 1 then
        return array
    end
    for i = 2, length do
        for j = length, i, -1 do
            if array[j] < array[j - 1] then
                tmp = array[j - 1]
                array[j - 1] = array[j]
                array[j] = tmp
            end
        end
    end
    return array
end

-- Select
function sortSelect(array)
    length = #array
    if length == 0 or length == 1 then
        return array
    end
    for i = 1, length - 1 do
        min = array[i]
        for j = i + 1, length do
            if min > array[j] then
                tmp = min
                min = array[j]
                array[j] = tmp
            end
        end
        array[i] = min
    end
    return array
end

-- Insert
function sortInsert(array)
    length = #array
    if length == 0 or length == 1 then
        return array
    end
    for i = 2, length do
        for j = i, 2, -1 do
            if array[j] >= array[j - 1] then
                break
            else
                tmp = array[j - 1]
                array[j - 1] = array[j]
                array[j] = tmp
            end
        end
    end
    return array
end

function printArray(array)
    sum = '{'
    for i = 1, #array do
        sum = sum .. tostring(array[i])
    end
    sum = sum .. '}'
    print(sum)
end

printArray(sortInsert({9, 8, 7, 6, 5, 4, 3, 2, 1}))
