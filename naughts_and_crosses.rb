# frozen_string_literal: true

class User
  attr_reader :name
  attr_accessor :score

  def initialize(name)
    @name = name
    @score = 0
  end
end

class Game < User
  def initialize(player1, player2)
    @one = 1
    @two = 2
    @three = 3
    @four = 4
    @five = 5
    @six = 6
    @seven = 7
    @eight = 8
    @nine = 9
    @player1 = player1
    @player2 = player2
    begin_game
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
    case input
    when 1
      @one = 'X' if @one == ' '
    when 2
      @two = 'X' if @two == ' '
    when 3
      @three = 'X' if @three == ' '
    when 4
      @four = 'X' if @four == ' '
    when 5
      @five = 'X' if @five == ' '
    when 6
      @six = 'X' if @six == ' '
    when 7
      @seven = 'X' if @seven == ' '
    when 8
      @eight = 'X' if @eight == ' '
    when 9
      @nine = 'X' if @nine == ' '
    end
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
    case input
    when 1
      @one = 'O' if @one == ' '
    when 2
      @two = 'O' if @two == ' '
    when 3
      @three = 'O' if @three == ' '
    when 4
      @four = 'O' if @four == ' '
    when 5
      @five = 'O' if @five == ' '
    when 6
      @six = 'O' if @six == ' '
    when 7
      @seven = 'O' if @seven == ' '
    when 8
      @eight = 'O' if @eight == ' '
    when 9
      @nine = 'O' if @nine == ' '
    end
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
      Game.new(@player1, @player2)
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
    @one = ' '
    @two = ' '
    @three = ' '
    @four = ' '
    @five = ' '
    @six = ' '
    @seven = ' '
    @eight = ' '
    @nine = ' '
  end

  def display
    "
     #{@seven}  |  #{@eight}  |  #{@nine}
    --- + --- + ---
     #{@four}  |  #{@five}  |  #{@six}
    --- + --- + ---
     #{@one}  |  #{@two}  |  #{@three}"
  end

  def check_for_win
    if @one == 'X' && @one == @four && @one == @seven || @one == 'O' && @one == @four && @one == @seven
      true
    elsif @two == 'X' && @two == @five && @two == @eight || @two == 'O' && @two == @five && @two == @eight
      true
    elsif @three == 'X' && @three == @six && @three == @nine || @three == 'O' && @three == @six && @three == @nine
      true
    elsif @one == 'X' && @one == @two && @one == @three || @one == 'O' && @one == @two && @one == @three
      true
    elsif @four == 'X' && @four == @five && @four == @six || @four == 'O' && @four == @five && @four == @six
      true
    elsif @seven == 'X' && @seven == @eight && @seven == @nine || @seven == 'O' && @seven == @eight && @seven == @nine
      true
    elsif @one == 'X' && @one == @five && @one == @nine || @one == 'O' && @one == @five && @one == @nine
      true
    elsif @three == 'X' && @three == @five && @three == @seven || @three == 'O' && @three == @five && @three == @seven
      true
    else
      false
    end
  end

  def check_for_tie
    if @one != ' ' && @two != ' ' && @three != ' ' && @four != ' ' && @five != ' ' && @six != ' ' && @seven != ' ' && @eight != ' ' && @nine != ' '
      true
    end
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
    case input
    when 1
      if @one != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 2
      if @two != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 3
      if @three != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 4
      if @four != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 5
      if @five != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 6
      if @six != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 7
      if @seven != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 8
      if @eight != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
    when 9
      if @nine != ' '
        puts 'This space is taken you duck egg, enter another'
        input_check(gets.chomp.to_i)
      else
        input
      end
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
Game.new(player1, player2)
