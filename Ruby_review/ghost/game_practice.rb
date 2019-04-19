require 'set'
require_relative "player"

class Game
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5

    def initialize(*players)
       @players = players
       words = File.readlines("dictionary.txt").map(&:chomp)
       @dictionary = Set.new(words)
       @losses = Hash.new {|losses,player| losses[player] = 0 }
    end

    def run 
        play_round until game_over?
        put "#{winner} wins!"
    end

    private

    attr_reader :fragment, :dictionary, :losses, :players
    def game_over?
        remaining_players == 1
    end

    def play_round
        fragment = ''
        welcome

        until round_over?
            take_turn
            next_player!
        end
        update_standings
    end

    # helper methods
    def add_letter(letter)
        @fragment << letter
    end

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)

        potential_fragment = fragment + letter
        @dictionary.any? {|word| word.start_with?(potential_fragment)}
    end

    def is_word?(fragment)
        @dictionary.include?(fragment)
    end

    def round_over?
        is_word?(fragment)
    end

    def current_player
        @players.first
    end

    def previous_player
        @players.last
    end

    def next_player!
        
    end

    def remaining_players 
        #underscore represents an unused variable
        #reference: https://po-ru.com/2012/09/21/rubys-magic-underscore
        
    end

    def winner 

    end

    def record(player)
        count = losses[player]
        "GHOST".slice(0,count)
    end

    #UI methods (display game status and prompts to players)
    def welcome
        system("clear")
        puts "Let's play a round of Ghost!"
        display_standings
    end

    def take_turn
        puts "It's #{current_player}'s turn!"

        letter = nil
        until letter
            letter = current_player.guess(fragment)

            unless  valid_play?
                current_player.alert_invalid_move(letter)
                letter = nil
            end
        end

        add_letter(letter)
        puts "#{current_player} added the letter '#{letter}' to the fragment"
    end

    def display_standings
        system("clear")
        puts "current standings: "

        players.each do |player|
            puts "#{player}: #{record(player)}"
        end
        sleep(2)
    end

    def update_standings

    end
end

if $PROGRAM_NAME == __FILE__
    game = Game.new(Player.new("PlayerA"), Player.new("PlayerB"))
    game.run
end
