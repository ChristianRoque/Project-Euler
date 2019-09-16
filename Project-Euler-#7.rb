
def st_prime(n)
    arr = []
    counter = 0
    i = 2
    while counter < n
      if prime?(i)
        arr << i
        counter += 1
      end
        i += 1
    end
    return arr[-1]
  end
  
  # def prime?(num)
  #   limit = Math.sqrt(num)
  #   (2..limit).all? {|factor|num % factor != 0}
  # end
  
  # puts st_prime(10001)