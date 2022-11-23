def validSolution(board)
    return false if have_zeroes?(board)
    
    valid_rows?(board) && valid_columns?(board) && valid_squares?(board)
  end
  
  def have_zeroes?(board)
    board.any? { |row| row.include?(0) }
  end
  
  def valid_rows?(board)
    board.all? { |row| valid_nine?(row) }
  end
  
  def valid_columns?(board)
    valid_rows?(board.transpose)
  end
  
  def valid_squares?(board)
    board_of_threes = board.map { |row| row.each_slice(3).to_a }.flatten(1)
    
    squares = []
    for i in (0..18).step(9) do
      for j in (0..2) do
        k = i + j
        squares << [board_of_threes[k], board_of_threes[k+3], board_of_threes[k+6]].flatten
      end
    end
    
    valid_rows?(squares)
  end
  
  def valid_nine?(nine)
    nine.uniq.count == 9
  end