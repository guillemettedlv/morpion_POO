require 'pry'
require 'terminal-table'

require_relative 'boardcase'
require_relative 'player'
require_relative 'game'

class Board < BoardCase

  def initialize
    @cases_array = []
    9. times do |position|
      @cases_array << {position => 0}
    end
  end

  def show_board  #https://github.com/tj/terminal-table
    rows = []
    rows << [" ","A", "B","C"]
    rows << :separator
    rows << ["1",case_value[0],case_value[1],case_value[2]]
    rows << :separator
    rows << ["2",case_value[3],case_value[4],case_value[5]]
    rows << :separator
    rows <<  ["3",case_value[6],case_value[7],case_value[8]]
    morpion_table = Terminal::Table.new :rows => rows  
    puts morpion_table
  end
  
  def menu  #https://github.com/tj/terminal-table
    rows = []
    rows << ["1", "2", "3"]
    rows << :separator
    rows << ["4", "5", "6"]
    rows << :separator
    rows <<  ["7", "8", "9"]
    menu_table = Terminal::Table.new :rows => rows  
    puts menu_table
  end

  def end_of_the_game?
    if ((case_value[0] == "X") && (case_value[1]== "X") && (case_value[2] == "X")) || ((case_value[3] == "X") && (case_value[4] == "X") && (case_value[5] == "X")) || ((case_value[6] == "X") && (case_value[7] == "X") && (case_value[8] == "X")) || ((case_value[0] == "X") && (case_value[3] == "X") && (case_value[6] == "X")) || ((case_value[1]== "X") && (case_value[4] == "X") && (case_value[7] == "X")) || ((case_value[2] == "X") && (case_value[5] == "X") && (case_value[8] == "X")) || ((case_value[6] == "X") && (case_value[4] == "X") && (case_value[2] == "X")) || ((case_value[0] == "X") && (case_value[4] == "X") && (case_value[8] == "X"))
      return true
    elsif ((case_value[0] == "O") && (case_value[1]== "O") && (case_value[2] == "O")) || ((case_value[3] == "O") && (case_value[4] == "O") && (case_value[5] == "O")) || ((case_value[6] == "O") && (case_value[7] == "O") && (case_value[8] == "O")) || ((case_value[0] == "O") && (case_value[3] == "O") && (case_value[6] == "O")) || ((case_value[1]== "O") && (case_value[4] == "O") && (case_value[7] == "O")) || ((case_value[2] == "O") && (case_value[5] == "O") && (case_value[8] == "O")) || ((case_value[6] == "O") && (case_value[4] == "O") && (case_value[2] == "O")) || ((case_value[0] == "O") && (case_value[4] == "O") && (case_value[8] == "O"))
      return true
    elsif case_value[0] != " " && case_value[1]!= " " && case_value[2] != " " && case_value[3] != " " && case_value[4] != " " && case_value[5] != " " && case_value[6] != " " && case_value[7] != " " && case_value[8] != " "
      return false
    end
  end


end