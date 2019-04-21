class Card
    VALUE = ("A".."Z").to_a
    def self.shuffled_cards(num)
        values = VALUES

        values = values.shuffle.take(num) * 2
        values.shuffle!
        values.map { |val| self.new(val)}
    end

    attr_reader :values

    def initialize(value, revealed = false)
      @value = value
      @revealed = revealed
    end

    def hide
        @revealed = false
    end

    def to_s
       revealed? ? value.to_s : " "
    end

    def reveal
        @revealed = true       
    end

    def revealed?
        @revealed
    end

    def ==(obj)
       obj.value == @value
    end
end