############ FIRST PROBLEM ################
def multiples_3_and_5(n)
    sum = 0
    (1...n).each do |num|
      if num % 3 == 0 || num % 5 == 0
        sum += num
      end
    end
    return sum
  end
  puts multiples_3_and_5(1000)