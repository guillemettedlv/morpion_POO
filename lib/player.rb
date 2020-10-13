class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name.to_s
    @life_points = 10
  end

  def show_state
    puts "#{name} a #{life_points} points de vie"
  end

  def gets_damage(points_loose)
    @points_loose = points_loose.to_i
    @life_points = @life_points - @points_loose
    if @life_points <= 0
      puts "#{name} a été tué !"
    end
  end

  def attacks(player_attacked)
    puts " #{self.name} attaque #{player_attacked.name}"
    result_de = compute_damage
    puts "Il lui inflige #{result_de} de dommages"
    player_attacked.gets_damage(result_de)
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player

attr_accessor :weapon_level

def initialize(name)
  @life_points = 100
  @weapon_level = 1
  @name = name.to_s
end

def show_state
  puts "Tu as #{life_points} points de vie et une arme de niveau #{weapon_level}"
end

def compute_damage
  rand(1..6) * @weapon_level
end

def search_weapon
  dice_result = rand(1..6)
  puts "Tu as trouvé une arme de niveau #{dice_result}"
  if dice_result > @weapon_level
    @weapon_level = dice_result
    puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
  else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  end
end

def search_health_pack
  dice2_result = rand(1..6)
  if dice2_result == 1
    puts "Tu n'as rien trouvé... "
  elsif dice2_result == 6
    if @life_points + 80 > 100
      @life_points = 100
    else @life_points += 80
    end
    puts  "Waow, tu as trouvé un pack de +80 points de vie !"
  else 
    if @life_points + 50 > 100
      @life_points = 100
    else @life_points += 50
    end
    puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  end
end

end