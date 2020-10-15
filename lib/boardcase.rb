require 'pry'
require 'terminal-table'

class BoardCase
  attr_accessor :cases_array

  def case_value
    cell_array = []
    @cases_array.each do |cell|
      if cell.values.to_s == "[1]"
        cell_array << "X"
      elsif cell.values.to_s == "[2]"
        cell_array << "O"
      else cell_array << " "
      end
    end
    return cell_array
  end

end