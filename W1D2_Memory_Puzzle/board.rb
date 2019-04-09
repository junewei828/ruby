require_relative "card"

class Board
    attr_reader :size

    def initialize(size = 4)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
        populate
    end

    def populate
        @Card.new
    end

    def [](position)
        row,col = position
        @grid[row][col]
    end

    def []=(position, value)
        row,col = position
        @grid[row][col] = value
    end

    def hide(position)
        self[position].hide
    end

    def reveal(position)
        if revealed?(position)
            puts "You can't flip a card that has already been revealed"
        else
            self[position].reveal
        end
        self[position].value
    end

    def populate
        num_pairs = (size**2) / 2
        cards = Card.shuffled_pairs(num_pairs)
        rows.each_index do |i|
            rows[i].each_index do |j|
                self[i][j] = cards.populate
            end
        end
    end

    def render
        system("clear")
        puts " #{(0...size).to_a.join(' ')}"
        rows.each_with_index do |row,i|
            puts "#{i} #{row.join(' ')}"
        end
    end

    def revealed?(pos)
        self[pos].revealed?
    end

    def won?
        rows.all? do |row|
            row.all?(&:revealed?)
        end
    end

    private

    attr_reader :rows
end