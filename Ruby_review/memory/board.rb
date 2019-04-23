require_relative "card"

class Board
    attr_reader :size, :grid

    def initialize(size = 4)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
        populate
    end

    def [](pos)
        i,j = pos
        @grid[i][j]
    end

    def []= (pos,value)
        i,j = pos
        @grid[i][j]= value
    end

    def render
        system("clear")
        puts "  #{(0...size).to_a.join(" ")}"
        @grid.each_with_index do |row,i|
            puts "#{i} #{row.join(" ")}"
        end
    end 

    def populate
        num = size * size / 2
        cards = Card.shuffled_cards(num)

        @grid.each_index do |i|
            @grid[i].each_index do |j|
                @grid[i][j]= cards.pop
            end
        end
    end

    def won?
        @grid.all? do |row|
            row.all?(&:revealed?)
        end
    end

    def reveal(pos)
        if revealed?(pos)
            puts "can't flip a card that is revealed"
        else 
            self[pos].reveal
        end
        self[pos].value
    end

    def revealed?(pos)
        self[pos].revealed?
    end

    def hide(pos)
        self[pos].hide
    end
end