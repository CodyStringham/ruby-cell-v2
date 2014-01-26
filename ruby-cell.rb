class CellGame

def initialize

  puts "How tall do you want the grid?"
  @tall = gets.chomp.to_i
  puts "How wide do you want the grid?"
  @wide = gets.chomp.to_i
  @days_passed = 0
  @cell_grid = Array.new(@tall) { Array.new(@wide) }
  @grid_storage = Array.new(@tall) { Array.new(@wide) }

  fill_grid_with_random_cells
end

def fill_grid_with_random_cells
  @cell_grid.each do |row|
    row.map! do |cell|
      roll = rand(20)
        if roll == 2
          "•"
        else
          " "
        end
    end
  end

  check_for_any_alive_cells
end

def check_for_any_alive_cells
  contains_alive = 0

  @cell_grid.each do |row|
    row.each do |cell|
      if cell.include?("•")
        contains_alive += 1
      end
    end
  end

  if contains_alive >= 1
    check_cells_for_future_state
  else
    print "No alive cells found"
    end_game_print_result
  end

end


def check_cells_for_future_state

  @cell_grid.each_with_index do |row, row_index|
    row.each_with_index do |cell, cell_index|
      
      add_row_shift = (row_index + 1)
        if add_row_shift == @tall || add_row_shift == @wide
          add_row_shift = 0
        end

      add_cell_shift = (cell_index + 1)
        if add_cell_shift == @tall || add_cell_shift == @wide
          add_cell_shift = 0
        end


      @live_neighbors = 0

      def does_this_include_alive(cell)
        if cell.include?("•")
          @live_neighbors += 1 
        end
      end
      
      top_left_cell = @cell_grid[(row_index - 1)][(cell_index - 1)] 
        does_this_include_alive(top_left_cell)
    

      top_cell = @cell_grid[(row_index - 1)][(cell_index)]
        does_this_include_alive(top_cell)

      top_right_cell = @cell_grid[(row_index - 1)][(add_cell_shift)]
         does_this_include_alive(top_right_cell)
      

      right_cell = @cell_grid[(row_index)][(add_cell_shift)]
        does_this_include_alive(right_cell)
 

      bottom_right_cell = @cell_grid[(add_row_shift)][(add_cell_shift)]
        does_this_include_alive(bottom_right_cell)
        

      bottom_cell = @cell_grid[(add_row_shift)][(cell_index)]
        does_this_include_alive(bottom_cell)
  

      bottom_left_cell = @cell_grid[(add_row_shift)][(cell_index - 1)] 
        does_this_include_alive(bottom_left_cell)
       

      left_cell = @cell_grid[(row_index)][(cell_index - 1)] 
        does_this_include_alive(left_cell)


      if @live_neighbors == 2 || @live_neighbors == 3
        @grid_storage[(row_index)][(cell_index)] = "•"

      else
        @grid_storage[(row_index)][(cell_index)] = " "
      end

    end
  end
  
  update_cell_grid
end

def update_cell_grid
  @cell_grid = @grid_storage.clone
  @grid_storage.each_with_index do |row, x|
      @cell_grid[x] = row.clone
    end

  @days_passed += 1

  print_cell_grid_and_counter
end


def print_cell_grid_and_counter

  system"clear"
  @cell_grid.each do |row|
    row.each do |cell|
      print cell + " "
    end
    print "\n"  
  end

  print "\n"
  print "Days passed: #{@days_passed}"
  sleep(0.15)
  check_for_any_alive_cells
end


def end_game_print_result
  print "#{@days_passed} days have passed, end of game."
end


end