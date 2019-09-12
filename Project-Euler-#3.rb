def largest_prime(n)
    arr = []
    i = 2
    while i <= n
      if n % i == 0
        n = n / i
        arr << i
        i = 1
      end
      i += 1
    end
    return arr
  end
  
  # def prime?(num)
  #   limit = Math.sqrt(num)
  #   (2..limit).all? {|factor|num % factor != 0}
  # end
  # puts largest_prime(600851475143)
  