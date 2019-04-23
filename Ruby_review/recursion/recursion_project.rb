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