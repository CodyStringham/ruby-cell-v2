#Make the game end when all cells are dead.
#Look at each cell one at a time to see if its alive or dead.
#Check to see how many cells are alive around that cell.
#Kill or give life to a cell if one of the rules are true.
#Print out the grid of cells after each tick.

#Live cell with < 2 neighboring cells = dead
#Live cell with > 3 neightboring cells = dead
#dead cell with 3 neighboring cells = live
#Live cells with 2-3 neighboring cells = live 

class CellGame

  def initialize
    @cell_grid = [[".", "o", "o", ".", "o"],
                           ["o", "o", "o", "o", "."],
                           ["o", ".", ".", ".", "o"],
                           [".", "o", "o", "o", "."],
                           [".", "o", ".", "o", "o"]]

    #Counts how many ticks the game has played
    @tick_count = 0

    #Goes to next method
    check_for_any_alive_cells
  end

  def check_for_any_alive_cells
    alive_cells = 0

    # Each loop that checks each cell for alive cells
    @cell_grid.each do |row|
      row.each do |cell|
        if cell.include?("o")
          alive_cells += 1
        end
      end
    end

    if alive_cells >= 1
      puts "Found #{alive_cells} alive cells in grid, going to the next method!"
      check_cells_for_future_state
    else
      end_game_print_result
    end

  end

def check_cells_for_future_state
  @cell_grid.each_with_index do |row, row_index|
    row.each_with_index do |cell, cell_index|
      puts ["Checking cell: [#{row_index}][#{cell_index}] "]
    end
  end

print_cell_grid_and_counter
end


def print_cell_grid_and_counter
  
  system"clear"
  @cell_grid.each do |row|
    row.each do |cell|
      print cell
      print " "
    end
    print "\n"  
  end

  @tick_count += 1
  print "Days passed: #{@tick_count}"
end


def end_game_print_result
  print "#{@tick_count} ticks were played, end of game."
end


end
