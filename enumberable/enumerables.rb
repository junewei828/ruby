class Array
    def my_each(&prc)
        i = 0
        new_arr = []
        while i < self.length
           new_arr << prc.call(self[i])
           i += 1
        end
        new_arr
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele unless prc.call(ele)
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false unless prc.call(ele)
        end
        true
    end

    def my_flatten
        flattend = []
        self.each do |ele|
            if ele.is_a?(Array)
                flattend += ele.my_flatten
            else
                flattend << ele
            end
        end
        flattend
    end

    def my_zip(*arrays)
        zipped = []
        
        (0..self.length-1).each do |i|
            sub = [self[i]]
            arrays.each do |array|
            sub << array[i]
            end
            zipped << sub
        end
        zipped
    end

    def my_rotate(num=1)
        new_arr = []
        (0..self.length-1).each do |i|
            new_idx = (i + num) % self.length
            new_arr << self[new_idx]
        end
        new_arr
     end

    def my_join(separator = '')
        str = ''
        self.each_with_index do |ele,i|
            if i != self.length-1
                str += ele + separator
            else
                str += ele
            end
        end
        str
    end

    def my_reverse
        reversed = []
        self.each do |ele|
            reversed.unshift(ele)
        end
        reversed
    end

    #my_inject with default acc
    def my_inject(acc= nil,&prc)
        duped = self.dup
        acc ||= duped.shift
        duped.each { |ele| acc = prc.call(acc,ele)}
        acc
    end

    #my_inject with no acc, the first element will be acc
    # def my_inject(&prc)
    #     duped = self.dup
    #     acc = duped.shift
    #     duped.each do |ele|
    #         acc = prc.call(acc,ele)
    #     end
    #     acc
    # end
    
end

def concatenate(strings)
    strings.my_inject('') do |acc,word|
        acc << word 
    end
end

def factors(num)
    result = []
    (1..num).each do |i|
        if num % i == 0
            result << i 
        end
    end
    result
end

class Array

    def bubble_sort!(&prc)
        prc ||= Proc.new {|a,b| a <=> b}

        sorted = false
        while !sorted 
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i],self[i + 1]) == 1
                    sorted = false
                    self[i], self[i + 1] = self[i + 1], self[i]
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        new_arr = self.dup
        new_arr.bubble_sort!(&prc)
    end
end

def substrings(string)
    subs = []
    (0..string.length-1).each do |i|
        (i..string.length-1).each do |j|
            subs << string[i..j]
        end
    end
    subs
end

def subwords(word,dictionary)
    subs = substrings(word)
    real_words = []
    dictionary.each do |word|
        real_words << word if subs.include?(word)
    end
    real_words
end












