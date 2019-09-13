def sum_square_dif(n)
    sum_square = 0
    sum = 0
  
    (1..n).each do |num|
      sum_square += (num * num)
      sum += num
    end
  
    return total = (sum * sum ) - sum_square
  end
  
  # puts sum_square_dif(100)
    