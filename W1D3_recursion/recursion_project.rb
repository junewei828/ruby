def range(start_num,end_num)
    return [] if start_num >= end_num

    [start_num] + range(start_num+1,end_num)
end

# p range(1,5) #=> [1,2,3,4]

def exp(b,n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        exp(b,n/2) ** 2
    else
        b * (exp(b, (n-1) / 2) ** 2)
    end
end

def exp(b,n)
    return 1 if n == 0
    if n > 0
        b * exp(b,n-1)
    else
        1.0 /b * exp(b,n+1)
    end
end

# p exp(2,5)

def deep_dup(arr)
    return arr if arr.size <= 1
    new_arr = []

    arr.each do |ele|
        if !ele.is_a?(Array)
            new_arr << ele
        else
            new_arr << deep_dup(ele)
        end
    end
    new_arr
end

# p deep_dup([1, [2], [3, [4]]])

def fibonacci(n)
    return 1 if n == 1 || n == 2
    fibonacci(n - 1) + fibonacci(n - 2)
end

# p fibonacci(6)

def bsearch(array, target)
    return nil if array.length == 0
    
    mid = array.length / 2
    return mid if array[mid] == target
    left = array.take(mid)
    right = array.drop(mid + 1)
    if target > array[mid]
        next_search = bsearch(right,target)
        return nil if next_search.nil?
        return mid + next_search + 1
    else
        return bsearch(left,target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length <= 1
    mid = array.length / 2
    sorted_left = merge_sort(array.take(mid))
    sorted_right = merge_sort(array.drop(mid))
    merge(sorted_left,sorted_right)
end

def merge(array_1,array_2)
    merged = []
    until array_1.empty? || array_2.empty?
        if array_1.first < array_2.first
            merged << array_1.shift
        else
            merged << array_2.shift
        end
    end
    merged.concat(array_1)
    merged.concat(array_2)
    merged
end

# p merge_sort([3,1,4,2,3,5,6,0])

def subsets(array)
    return [array] if array.empty?
    subs_without_first = subsets(array[1..-1])
    subs_with_first = []
    subs_without_first.each do |sub|
        subs_with_first << [array.first] + sub
    end
    subs_with_first + subs_without_first
end

p subsets([1, 2, 3])

def permutations(array)
    return [array] if array.length <= 1
    first = array.shift
    perms = permutations(array)
    total_permutation = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            total_permutation << perm[0...i] + [first] + perm[i..-1]
        end
    end
    total_permutation
end

# p permutations([1,2,3])
