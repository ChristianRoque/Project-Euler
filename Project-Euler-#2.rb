def fibonacci(n)
    n1, n2 = 1, 2
    sum = 3
    even_sum = 2
    until n2 >= n
      n1, n2 = n2, n1 + n2
      if n2 % 2 == 0
        even_sum += n2
      end
      sum += n2
    end
    return even_sum
  end
  
  
puts fibonacci(4000000)