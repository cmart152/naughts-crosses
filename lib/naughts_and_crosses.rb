# frozen_string_literal: true
require 'pry-byebug'


class User
  attr_reader :name
  attr_accessor :score

  def initialize(name)
    @name = name
    @score = 0
  end
end

class Game < User
  attr_accessor :arr
  def initialize(player1, player2)
    @arr = [11, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1 = player1
    @player2 = player2
  end

  def begin_game
    puts display
    re_initialize
    puts "
    Make note the layout coresponds to a standard keyboard number pad layout, this will be your input method

    #{@player1.name} where do you want to place your first X?"
      user1_turn(input_check(gets.chomp.to_i))
  end

  def user1_turn(input)

    arr[input] = 'X' if arr[input] == ' '
    system('clear')
    puts display

    if check_for_win == true
      @player1.score += 1
      puts "
      #{@player1.name} won!"
      match_end
    elsif check_for_tie == true
      puts 'This rounds a tie :/'
      match_end
    else
      puts "

    #{@player2.name} (O's), your turn"
      user2_turn(input_check(gets.chomp.to_i))
    end
  end

  def user2_turn(input)
    arr[input] = 'O' if arr[input] == ' '
    system('clear')
    puts display

    if check_for_win == true
      @player2.score += 1
      puts "
      #{@player2.name} won!"
      match_end
    elsif check_for_tie == true
      puts 'This rounds a tie :/'
      match_end
    else
      puts "

    #{@player1.name} (X's), your turn"
      user1_turn(input_check(gets.chomp.to_i))
    end
  end

  def match_end
    puts "The score is #{@player1.name} - #{@player1.score} / #{@player2.name} - #{@player2.score}
      Play again? y/n"
    if check_play_again(gets.chomp.downcase) == 'y'
      system('clear')
      game = Game.new(@player1, @player2)
      game.begin_game
    else
      end_game
    end
  end

  def end_game
    if @player1.score > @player2.score
      puts "  #{@player1.name} is victorious!"
    elsif @player2.score > @player1.score
      puts "  #{@player2.name} is victorious!"
    else
      puts "It's a tie!"
    end
  end

  def re_initialize
    arr.map! {|item| item = ' '}
    arr[0] = 11
  end

  def display
    "
    #{arr[7]}  |  #{arr[8]}  |  #{arr[9]}
    --- + --- + ---
    #{arr[4]}  |  #{arr[5]}  |  #{arr[6]}
    --- + --- + ---
    #{arr[1]}  |  #{arr[2]}  |  #{arr[3]}"
  end

  def check_for_win
    if arr[1] == arr[4] && arr[1] == arr[7] && arr[1] != ' '
      true
    elsif arr[2] == arr[5] && arr[2] == arr[8] && arr[2] != ' '
      true
    elsif arr[3] == arr[6] && arr[3] == arr[9] && arr[3] != ' '
      true
    elsif arr[1] == arr[2] && arr[1] == arr[3] && arr[1] != ' '
      true
    elsif arr[4] == arr[5] && arr[4] == arr[6] && arr[4] != ' '
      true
    elsif arr[7] == arr[8] && arr[7] == arr[9] && arr[7] != ' '
      true
    elsif arr[1] ==arr[5] && arr[1] == arr[9] && arr[1] != ' '
      true
    elsif arr[3] == arr[5] && arr[3] == arr[7] && arr[3] != ' '
      true
    else
      false
    end
  end

  def check_for_tie
    return false if arr.include?(' ')
  end

  def input_check(input)
    if input.positive? && input < 10
      check_for_empty_space(input)
    else
      puts 'You need to enter a number between 1 and 9 corresponding to the board'
      input = gets.chomp.to_i
      input_check(input)
    end
  end

  def check_for_empty_space(input)
      if arr[input] != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
  end

  def check_play_again(input)
    if %w[y n].include?(input)
      input
    else
      puts 'Enter y/n'
      check_play_again(gets.chomp.downcase)
    end
  end
end


puts 'who is player 1?'
player1 = User.new(gets.chomp)
puts 'Who is player 2?'
player2 = User.new(gets.chomp)
system('clear')
game = Game.new(player1, player2)
game.begin_game 
