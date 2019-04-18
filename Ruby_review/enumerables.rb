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
end

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]

p a.my_reject { |num| num == 4 } # => [1, 2, 3]
