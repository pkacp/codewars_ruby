def validSolution(board)
  sudoku_sections = rows(board) + columns(board) + blocks(board)
  sudoku_sections.all?{|section| contains_all_nine?(section)}
end

def rows(board)
  board
end

def columns(board)
  board.transpose
end

def blocks(board)
  board.map{|row| row.each_slice(3).to_a}.transpose.flatten.each_slice(9).to_a
end
  
def contains_all_nine?(section)
  [1,2,3,4,5,6,7,8,9].to_set == section.to_set
end