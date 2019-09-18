def prime_sum(n)
    sum = 0
    (2..n).each do |num|
      if prime?(num)
        sum += num
      end
    end
    return sum
  end
  
  def prime?(num)
    limit = Math.sqrt(num)
    (2..limit).all? {|factor|num % factor != 0}
  end
  
  puts prime_sum(2000000)