require 'pry'
require_relative 'player'
require_relative 'board'

class Game < Player
  attr_accessor :board, :current_player, :status, :players

def initialize
  puts "Joueur 1, quel est ton nom ?"
  print ">"
  name = gets.chomp
  @player1 = Player.new(name, "X")

  puts "Joueur 2, quel est ton nom ?"
  print ">"
  name = gets.chomp
  @player2 = Player.new(name, "0")

  @players = Array.new
  @players << @player1
  @players << @player2

  @board = Board.new
end

def turn_player1
  puts "#{@player1.name}, à toi de jouer !"
  puts "Choisis une case :"
  choice = gets.chomp.to_i
    while @board.cases_array[choice-1].values.to_s != '[0]'
      puts "Impossible, cette case est déjà prise ! Choisis une autre case :"
      choice = gets.chomp.to_i
    end
      @board.cases_array[choice-1] = {choice-1 => 1}
  end
  
  def turn_player2
  puts "#{@player2.name}, à toi de jouer !"
  puts "Choisis une case :"
  choice = gets.chomp.to_i
    while @board.cases_array[choice-1].values.to_s != '[0]'
      puts "Impossible, cette case est déjà prise ! Choisis une autre case :"
      choice = gets.chomp.to_i
    end
      @board.cases_array[choice-1] = {choice-1 => 2}
  end

  def perform
    count = 0
    puts
    puts
    puts "Appuyez sur entrée pour jouer"
    lancement = gets.chomp

    while count < 8
    @board.show_board
    @board.menu
    turn_player1
    count += 1

    if @board.end_of_the_game?
      puts "Bravo #{@player1.name}, tu as gagné !"
      break
    elsif @board.end_of_the_game? == false
      puts "Match nul !"
    end

    @board.show_board
    @board.menu
    turn_player2
    count += 1

    if @board.end_of_the_game?
      puts "Bravo #{@player2.name}, tu as gagné !"
      break
    elsif @board.end_of_the_game? == false
      puts "Match nul !"
      break
    end
    end
  end

end

