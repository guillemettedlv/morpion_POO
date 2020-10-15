require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'show'

loop do
 class Application < Game

  puts "*"*30
  puts "Bienvenu à tous au jeu du .... MORPION!"
  puts "*"*30


  game1 = Game.new

  game1.perform
  
  puts "\n\La partie est finie !"
  puts "Souhaitez vous rejouer ? (y/n)"
  restart = gets.chomp
  break if restart != 'y'
end
end
