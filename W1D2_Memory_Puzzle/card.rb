require_relative "board"

class Card
    VALUES = ('A'..'Z').to_a

    def self.shuffled_pairs(num_pairs)
        values = VALUES

        while num_pairs > values.length
            values = values + values 
        end

        values = values.shuffle.take(num_pairs) * 2
        values.shuffle!
        values.map {|val| self.new(val)}
    end


    attr_reader :value

    def initialize(value,revealed= false)
        @value = value
        @revealed = revealed
    end

    def hide
        @revealed = false
    end 

    def reveal
       @revealed = true
    end

    def revealed?
        @revealed        
    end

    def to_s
        self.revealed? ? value.to_s : " "
    end

    def ==(object)
        object.is_a?(self.class) && object.value == self.value
    end
end