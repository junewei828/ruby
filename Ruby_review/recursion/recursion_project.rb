def range(num1,num2)
    return [] if num1 >= num2
    [num1] + range(num1+1,num2)
end

# p range(1,5)

# def exp(b,n)
#     return 1 if n == 0
#     if n > 0
#         b * exp(b, n - 1)
#     elsif n < 0
#         1.0/b * exp(b, n + 1)
#     end
# end


def exp(b,n)
    return 1 if n == 0
    return b if n == 1
    if n > 0 && n.even?
        exp(b,n/2) ** 2
    elsif n > 0 && n.odd?
        b * exp(b,(n-1)/2)**2
    elsif n < 0 && n.even?
        exp(1.0/b,n/2)  ** 2
    elsif n < 0 && n.odd?
        1.0/b * exp(b,(n+1)/2) **2
    end
end

#  p exp(2,3)
#  p exp(2,4)
# p exp(2, -4)
# p exp(2,-3)

# class Array
#     def deep_dup
#         duped = []
#         return self if self.length == 0
#         (0..self.length-1).each do |i|
#             if self[i].is_a?(Array)
#                 duped += self[i]
#             else
#                 duped << self[i]
#             end
#         end
#         duped
#     end
# end

class Array
    def deep_dup
        return self if self.length == 0
        duped = []
        (0..self.length-1).each do |i|
            ele = self[i].is_a?(Array) ? self[i].deep_dup : self[i]
            duped << ele
        end
        duped
    end
end

# p [1, [2], [3, [4]]].deep_dup

def fib(n)
    return nil if n < 1
    return 1 if n == 1 || n == 2
    fib(n-1) + fib(n-2)
end

# p fib(6)

class Array
    def bsearch(target)
        return nil if self.length == 0
        mid = self.length / 2
        return mid if self[mid] == target

        left = self.take(mid)
        right = self.drop(mid+ 1)

        if target > self[mid]
            next_search = right.bsearch(target)
            return mid + next_search + 1
        else
            return left.bsearch(target)
        end
    end
end

p [2,4,6,8,9].bsearch(6)