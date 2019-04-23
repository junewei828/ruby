class Card
    VALUES= ("A".."Z").to_a
    attr_reader :value

    def self.shuffled_cards(num)
        values = VALUES
        values = values.shuffle.take(num) * 2
        values.shuffle!
        values.map {|value| self.new(value)}
    end

    def initialize(value,revealed = false)
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
        revealed? ? @value.to_s : " "
    end

    def ==(obj)
        @value == obj.value
    end
end