require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


my_game = Game.new("Guillemette")
puts my_game.kill_player("José")