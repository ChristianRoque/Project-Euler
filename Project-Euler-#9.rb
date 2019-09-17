
def pythagorean_triplet(num)
    (1..num).each do |a|
      (a..num).each do |b|
        c = 1000 - b - a
       if (c**2 == a**2 + b**2)
         return a * b * c
       end
      end
   end
  end
  
  puts pythagorean_triplet(1000)
  