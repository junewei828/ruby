require_relative "board"
require_relative "human_player"

class Game
    def initialize(player, size = 4)
        @board = Board.new(size)
        @player = player
        @previous_guess = nil
    end

    def compare_guess(new_guess)
        if previous_guess
            if (@board[previous_guess] == @board[new_guess]) && (@previous_guess != new_guess)
                # player.receive_match(previous_guess,new_guess)
                puts "it's a match!"
            else
                puts "Try again"
                [previous_guess,new_guess].each {|pos| board.hide(pos)}
            end
            self.previous_guess = nil
            @player.previous_guess = nil
        else
            self.previous_guess = new_guess
            @player.previous_guess = new_guess
        end
    end

    def get_player_input
        pos = nil
        until pos && valid_pos?(pos)
            pos = @player.get_input
        end
        pos
    end

    def make_guess(pos)
        reveal_value = board.reveal(pos)
        @player.receive_revealed_card(pos,reveal_value)
        board.render

        compare_guess(pos)

        sleep(1)
        board.render
    end

    def play
        until board.won?
            board.render
            pos = get_player_input
            make_guess(pos)
        end
        puts "Congratulations, you win!"
    end

    def valid_pos?(pos)
        pos.is_a?(Array) && 
        pos.count == 2 &&
        pos.all? {|x| x.between?(0, board.size - 1)}
    end

    private

    attr_reader :board
    attr_accessor :previous_guess
end

if $PROGRAM_NAME == __FILE__
    size = ARGV.empty? ? 4 : ARGV.shift.to_i
    Game.new(HumanPlayer.new(size),size).play
end