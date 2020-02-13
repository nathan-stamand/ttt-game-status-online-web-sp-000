require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]
  
def won?(board)
  
  i = 0
  
  while i < 8
    
    position_1 = board[WIN_COMBINATIONS[i][0]]
    position_2 = board[WIN_COMBINATIONS[i][1]]
    position_3 = board[WIN_COMBINATIONS[i][2]]
    
    if [position_1, position_2, position_3] == ["X", "X", "X"]
      return WIN_COMBINATIONS[i]

    elsif [position_1, position_2, position_3] == ["O", "O", "O"]
      return WIN_COMBINATIONS[i]
      
    else
      i += 1
      
    end
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  
full?(board) && !won?(board)

end

def over?(board)
  
  if won?(board)
    return true
    
  elsif draw?(board) 
    return true
    
  else
    return false
    
  end
end

def winner(board)
  
  if combo = won?(board)
    board[combo[0]]
  end
end

