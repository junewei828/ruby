class Stack
    def initialize
        @original_arr = []
    end

    def push(el)
        @original_arr.push(el)
    end

    def pop
        @original_arr.pop
    end

    def peek
        @original_arr.last
    end
    private
    attr_reader :original_arr
end
