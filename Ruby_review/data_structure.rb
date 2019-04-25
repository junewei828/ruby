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

class Queue
    def initialize
        @queue_array = []
    end

    def enqueue(el)
        @queue_array.unshift(el)
    end

    def dequeue
        @queue_array.pop
    end

    def peek
        @queue_array.first
    end

    private
    attr_reader :queue_array
end

class Map
    def initialize
        @arr_map = []
    end

    def set(key,value)
        idx = @arr_map.index {|pair| pair[0] == key }
        if pair_index
            arr_map[idx][1] = value
        else
            @arr_map << [key,value]
        end
    end

    def get(key)
        @arr_map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        value = get(key)
        @arr_map.reject! { |pair| pair[0] == key}
        value
    end

    def show
        deep_dup(@arr_map)
    end

    private 
    attr_reader :arr_map

    def deep_dup(arr)
        arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
    end
end
