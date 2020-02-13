def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  
  i = 0
  
  while i < 9
  
    win_position_1 = WIN_COMBINATIONS[i][0]
    win_position_2 = WIN_COMBINATIONS[i][1]
    win_position_3 = WIN_COMBINATIONS[i][2]
    position_1 = board[WIN_COMBINATIONS[i][0]]
    position_2 = board[WIN_COMBINATIONS[i][1]]
    position_3 = board[WIN_COMBINATIONS[i][2]]
  
    if [position_1, position_2, position_3] == ["X", "X", "X"]
      return WIN_COMBINATIONS[i]
      
    elsif [position_1, position_2, position_3] == ["O", "O", "O"]
      return WIN_COMBINATIONS[i]
      
    elsif board.all? {|i| i == " "}
      return false
      
    elsif board.none? {|i| i == " "}
      return nil
      
    else
      i += 1
      
    end
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  
  if won?(board)
    return false
    
  elsif full?(board) 
    return true
    
  else
    return false
    
  end
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
  
  number = board.select do |i|
    i == "X"
    i == "O"
  end
  
  if won?(board) != false
    if number.count % 2 == 1 
      return "O"
    else
      return "X"
    end
  elsif draw?(board)
    return nil
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]