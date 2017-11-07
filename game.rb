require_relative './player.rb'
require_relative './testanswer.rb'

class Game

  def initialize
    @player1 = create_player(1)
    @player2 = create_player(2)
  end

  def create_player(number)
    print "What is the name of player #{number}? "
    name = gets.chomp
    Player.new(name)
  end

  def ask_player_question(player)
    question = Question.new
    print "#{question.ask_player(player)}: "
    answer = gets.chomp.to_i
    correct = question.answer_is_correct?(answer)
  end

  def create_turn(current_player)
    correct = ask_player_question(current_player)
    if correct
      puts "#{current_player.name}, you got it right"
    else
      current_player.take_life
      puts "#{current_player.name}, you got it wrong"
    end
  end

  def play
    until @player1.dead? || @player2.dead?
      create_turn(@player1)
      create_turn(@player2)
    end
    puts "Game Over, score is for #{@player1.name} - #{@player1.lives} lives vs #{@player2.name} - #{@player2.lives}"
  end
end

game = Game.new
game.play