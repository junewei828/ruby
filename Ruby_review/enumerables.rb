require 'byebug'
class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

# p [1,2,3].my_each {|num| num * 2}

    def my_select(&prc)
        array = []
        self.my_each do |ele|
            array << ele if prc.call(ele)
        end
        array 
    end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if !prc.call(ele)
        end
        arr
    end

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]

# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

    def my_all?(&prc)
        self.my_each do |ele|
            return false unless prc.call(ele)
        end
        true
    end


#  p a.my_all? { |num| num > 1 } # => false
#  p a.my_all? { |num| num < 4 } # => true

    def my_flatten
        flattened = []
        self.each do |ele|
            if ele.is_a?(Array)
                flattened += ele.my_flatten
            else 
                flattened << ele
            end
        end
        flattened
    end

    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

    def my_zip(*arrs)
        zipped = []
        self.each_with_index do |ele, i|
            sub = [ele]
            arrs.each do |arr|
                sub << arr[i]
            end
            zipped << sub
        end
        zipped
    end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # return self
    def my_rotate(n=1)
        split_index = n % self.length
        self.drop(split_index) + self.take(split_index)
    end

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

    def my_join(sep='')
        str = ''
        self.each_with_index do |ele, i|
            if i == self.length-1
                str += ele 
            else
                str += ele + sep
            end
        end
        str
    end

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

    def my_reverse
        new_arr = []
        i = self.length-1
        while i >= 0
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end
end
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

def factors(num)
    facs = []
    i = 1
    while i <= num
        if num % i == 0
            facs << i
        end
        i +=  1
    end
    facs
end

# p factors(9)

class Array
    def bubble_sort!(&prc)
        prc ||= Proc.new {|a,b| a <=> b }
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i],self[i + 1]) == 1
                    self[i],self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        self.dup.bubble_sort!(&prc)
    end
end

def substrings(string)
    arr = []
    (0...string.length).each do |i|
        (0...string.length).each do |j|
            sub = string[i..j]
            arr << sub unless arr.include?(sub)
        end
    end
    arr 
end

# p substrings("apple")

# p [2,4,3,5,1].bubble_sort! {|a,b| a*(-1) <=> b * (-1)}

def subwords(word,dictionary)
    arr = []
    (0...word.length-1).each do |i|
        (i + 1..word.length-1).each do |j|
            subword = word[i..j]
            if dictionary.include?(subword)
                arr << subword unless arr.include?(subword)
            end
        end
    end
    arr
end



