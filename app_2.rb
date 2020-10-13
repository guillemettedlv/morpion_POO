require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*************************************************"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|" 
puts "*************************************************"

puts "Quel est ton nom ?"
user_name = gets.chomp
user = HumanPlayer.new(user_name)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies_array = [player1,player2]

while user.life_points > 0 && (player1.life_points >0 || player2.life_points >0)
  gets.chomp
  puts "***********************"
  puts "Voici ton état :"
  print user.show_state

  gets.chomp
  puts "***********************"
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "attaquer un joueur en vue :"
    print "0 - " 
    print "#{player1.show_state}"
    print "1 - "
    print "#{player2.show_state}"

  print ">"
  print action = gets.chomp
  
  if action == "a"
    puts user.search_weapon
  elsif action == "s"
    puts user.search_health_pack
  elsif action == "0"
    puts user.attacks(player1)
    puts player1.show_state
  else
    puts user.attacks(player2)
    puts player2.show_state
  end

  gets.chomp
  puts "***********************"
  puts "Les autres joueurs t'attaquent !"
  enemies_array.each do |enemy|
    if enemy.life_points > 0
    enemy.attacks(user)
    end
  end
end

  puts "La partie est finie!"
  if user.life_points > 0 
    puts "BRAVO ! TU AS GAGNE !"
  else puts "Loser ! Tu as perdu !"
  end


