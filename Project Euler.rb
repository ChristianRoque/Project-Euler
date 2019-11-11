############ FIRST PROBLEM ################



def multiples_3_and_5(n)
  return (1...n).inject(0) { |acc, num| num % 3 == 0 || num % 5 == 0 ? acc + num : acc}
end

# puts multiples_3_and_5(1000)



########### SECOND PROBLEM #############



def fibonacci(n)
  n1, n2 = 1, 2
  even_sum = 2
  until n2 >= n
    n1, n2 = n2, n1 + n2
    even_sum += n2 if n2.even? # n2 % 2 == 0
  end
  return even_sum
end

# puts fibonacci(4000000)




################## THIRD PROBLEM ###############




def largest_prime(num)
  largest_prime = 0
  i = 2
  while i <= num
    if num % i == 0
      num = num / i
      largest_prime = i if i > largest_prime
      i = 1
    end
    i += 1
  end
  return largest_prime
end

# puts largest_prime(600851475143)



################ FOURTH PROBLEM ##########


def largest_palindrome(n)
  largest_pali = 0
  b = ((n / 2) + (n / 4)) # cutting numbers that are too low 

  (b..n).each_with_index do |num,idx|
    (b..n).each_with_index do |num2,idx2|
      if idx2 > idx 
        mult = num * num2
        largest_pali = mult if palindrome?(mult) && mult > largest_pali
      end
    end
  end

  return largest_pali
end

def palindrome?(num)
  num_arr = num.to_s.split("")
  return num_arr == num_arr.reverse
end

# puts largest_palindrome(999)


############### FITH PROBLEM ###########



def smallest_multiple(factor)
  arrHashes = []
  finalHash = Hash.new(0)
  (2..factor).each {|factor| arrHashes << deconstruct(factor) }
  arrHashes.each do |hash| 
      hash.each do |key, value|
          finalHash[key] = value if finalHash[key] < value
      end
  end

  return finalHash.inject(1) {|acc, (key,value)| acc * (key ** value) }
end


def deconstruct(number)

  return {number => 1} if prime?(number)

  hash = Hash.new(0)
  i = 2
  changed = number

  until (hash.inject(1) {|acc, (key, value)| acc * (key ** hash[key]) }) == number
    if changed % i == 0
      hash[i] += 1
      changed = changed / i
      i = 1
    end
    i += 1
  end

  return hash
end

def prime?(num)
limit = Math.sqrt(num)
(2..limit).all? {|factor|num % factor != 0}
end

# puts smallest_multiple(20)



############# SIXTH PROBLEM #############


# def sum_square_dif(n)
#   sum_square = 0
#   sum = 0

#   (1..n).each do |num|
#     sum_square += (num * num)
#     sum += num
#   end

#   return total = (sum * sum ) - sum_square
# end


def sum_square_dif(n)
  ((1..n).inject(1) {|acc, num| acc + num  } ** 2) - (1..n).inject(1) {|acc, num| acc + (num ** 2)  } 
end

# puts sum_square_dif(100)



############ SEVENTH PROBLEM ###########




def st_prime(n)
  st_prime = 0
  counter = 0
  i = 2
  while counter < n
    if prime?(i)
      st_prime = i
      counter += 1
    end
      i += 1
  end
  return st_prime
end

def prime?(num)
  limit = Math.sqrt(num)
  (2..limit).all? {|factor|num % factor != 0}
end

# puts st_prime(10001)




############ EIGTH PROBLEM ##############




def largest_in_series(series,n)
  group_arr = []
  limit = series.length - n
  integer_arr = series.split("").map {|string| string.to_i }

  (0..limit).each {|idx| group_arr << integer_arr[idx...idx + n].inject(1){|acc, num| acc * num }}

  return group_arr.max
end

# p largest_in_series("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450",13)



############# NINTH PROBLEM ##############



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

# puts pythagorean_triplet(1000)



########### TENTH PROBLEM ##########



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

# puts prime_sum(2000000)

############# ELEVENTH PROBLEM ###########



grid_string = <<EOS
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
EOS

grid = []
grid_string.each_line do |line|
  grid.push line.split
end

directions = []
(-1..1).each do |x|
  (-1..1).each do |y|
    directions.push([x, y]) unless x == 0 && y == 0
  end
end

max = 0
grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    directions.each do |x_dir, y_dir|
      product = 1
      4.times do |i|
        x_pos = x + i * x_dir
        y_pos = y + i * y_dir
        unless (x_pos < 0 || x_pos >= row.length) || (y_pos < 0 || y_pos >= grid.length)
          product *= grid[y_pos][x_pos].to_i
        end
      end
      if product > max
        max = product
      end
    end
  end
end
# puts max



############ TWELVETH PROBLEM ###########

def triangular_number(n)
  i = 1
  count = 2
  until deconstructN(i) > n
     i = i + count
     count = count + 1
  end
  return i
end

def deconstructN(number)
  sum = 0
  i = 1
  while i <= Math.sqrt(number)
    if number % i == 0
      sum += 1
    end
    i += 1
  end

  sum *= 2
  sum -= 1 if Math.sqrt(sum) % 1 == 0

  return sum
end

puts triangular_number(500)


########### THIRDTEENTH PROBLEM ##########
def first_nth_digits(n,series)
  series_arr = series.split(" ").map {|string| string.to_i }
  result = series_arr.reduce(:+).to_s
  return result[0...n]
end


# puts first_nth_digits(10,"37107287533902102798797998220837590246510135740250
# 46376937677490009712648124896970078050417018260538
# 74324986199524741059474233309513058123726617309629
# 91942213363574161572522430563301811072406154908250
# 23067588207539346171171980310421047513778063246676
# 89261670696623633820136378418383684178734361726757
# 28112879812849979408065481931592621691275889832738
# 44274228917432520321923589422876796487670272189318
# 47451445736001306439091167216856844588711603153276
# 70386486105843025439939619828917593665686757934951
# 62176457141856560629502157223196586755079324193331
# 64906352462741904929101432445813822663347944758178
# 92575867718337217661963751590579239728245598838407
# 58203565325359399008402633568948830189458628227828
# 80181199384826282014278194139940567587151170094390
# 35398664372827112653829987240784473053190104293586
# 86515506006295864861532075273371959191420517255829
# 71693888707715466499115593487603532921714970056938
# 54370070576826684624621495650076471787294438377604
# 53282654108756828443191190634694037855217779295145
# 36123272525000296071075082563815656710885258350721
# 45876576172410976447339110607218265236877223636045
# 17423706905851860660448207621209813287860733969412
# 81142660418086830619328460811191061556940512689692
# 51934325451728388641918047049293215058642563049483
# 62467221648435076201727918039944693004732956340691
# 15732444386908125794514089057706229429197107928209
# 55037687525678773091862540744969844508330393682126
# 18336384825330154686196124348767681297534375946515
# 80386287592878490201521685554828717201219257766954
# 78182833757993103614740356856449095527097864797581
# 16726320100436897842553539920931837441497806860984
# 48403098129077791799088218795327364475675590848030
# 87086987551392711854517078544161852424320693150332
# 59959406895756536782107074926966537676326235447210
# 69793950679652694742597709739166693763042633987085
# 41052684708299085211399427365734116182760315001271
# 65378607361501080857009149939512557028198746004375
# 35829035317434717326932123578154982629742552737307
# 94953759765105305946966067683156574377167401875275
# 88902802571733229619176668713819931811048770190271
# 25267680276078003013678680992525463401061632866526
# 36270218540497705585629946580636237993140746255962
# 24074486908231174977792365466257246923322810917141
# 91430288197103288597806669760892938638285025333403
# 34413065578016127815921815005561868836468420090470
# 23053081172816430487623791969842487255036638784583
# 11487696932154902810424020138335124462181441773470
# 63783299490636259666498587618221225225512486764533
# 67720186971698544312419572409913959008952310058822
# 95548255300263520781532296796249481641953868218774
# 76085327132285723110424803456124867697064507995236
# 37774242535411291684276865538926205024910326572967
# 23701913275725675285653248258265463092207058596522
# 29798860272258331913126375147341994889534765745501
# 18495701454879288984856827726077713721403798879715
# 38298203783031473527721580348144513491373226651381
# 34829543829199918180278916522431027392251122869539
# 40957953066405232632538044100059654939159879593635
# 29746152185502371307642255121183693803580388584903
# 41698116222072977186158236678424689157993532961922
# 62467957194401269043877107275048102390895523597457
# 23189706772547915061505504953922979530901129967519
# 86188088225875314529584099251203829009407770775672
# 11306739708304724483816533873502340845647058077308
# 82959174767140363198008187129011875491310547126581
# 97623331044818386269515456334926366572897563400500
# 42846280183517070527831839425882145521227251250327
# 55121603546981200581762165212827652751691296897789
# 32238195734329339946437501907836945765883352399886
# 75506164965184775180738168837861091527357929701337
# 62177842752192623401942399639168044983993173312731
# 32924185707147349566916674687634660915035914677504
# 99518671430235219628894890102423325116913619626622
# 73267460800591547471830798392868535206946944540724
# 76841822524674417161514036427982273348055556214818
# 97142617910342598647204516893989422179826088076852
# 87783646182799346313767754307809363333018982642090
# 10848802521674670883215120185883543223812876952786
# 71329612474782464538636993009049310363619763878039
# 62184073572399794223406235393808339651327408011116
# 66627891981488087797941876876144230030984490851411
# 60661826293682836764744779239180335110989069790714
# 85786944089552990653640447425576083659976645795096
# 66024396409905389607120198219976047599490197230297
# 64913982680032973156037120041377903785566085089252
# 16730939319872750275468906903707539413042652315011
# 94809377245048795150954100921645863754710598436791
# 78639167021187492431995700641917969777599028300699
# 15368713711936614952811305876380278410754449733078
# 40789923115535562561142322423255033685442488917353
# 44889911501440648020369068063960672322193204149535
# 41503128880339536053299340368006977710650566631954
# 81234880673210146739058568557934581403627822703280
# 82616570773948327592232845941706525094512325230608
# 22918802058777319719839450180888072429661980811197
# 77158542502016545090413245809786882778948721859617
# 72107838435069186155435662884062257473692284509516
# 20849603980134001723930671666823555245252804609722
# 53503534226472524250874054075591789781264330331690")


################ FOURTHTEEN PROBLEM ##################

def longest_collatz(n)
  longest_chain = 1
  number_chain = 0
  (1..n).each do |number|
    if collatz_length(number) > longest_chain
      longest_chain = collatz_length(number)
      number_chain = number
    end
  end
    return number_chain
end

def collatz_length(num)
  number = num
  count = 1
  while  number != 1
    if number % 2 == 0
      number = number / 2
      count += 1
    elsif number % 2 != 0
      number = (number * 3) + 1
      count += 1
    end
  end
  return count
end

# puts longest_collatz(1000000)

################ FIFTEENTH PROBLEM #############

def lattice_paths(length)
  arr = [[1,1],[1]]
  until arr.length == (length * 2) + 1
    next_lv = adjacent_sum(arr[0])
    arr.unshift(next_lv)
  end
  print arr.max.max
end

def adjacent_sum(arr)
  new_arr = []
  arr.each_with_index do |num,idx|
    if idx == 0
      new_arr << 1
    elsif idx < arr.length
      new_value = arr[idx - 1] + num
      new_arr << new_value
    end
  end
  return new_arr << 1
end

 # puts lattice_paths(20)

################# SIXTEENTH PROBLEM ###############

def power_digit_sum(power,number)
  sum = 0
  result = (number**power).to_s
  result.each_char {|int| sum += int.to_i }
  return sum
end

# puts power_digit_sum(1000,2)


############### SEVENTEENTH PROBLEM ############

def number_letter_count(n)
  single = {"1" => 3 ,"2" => 3 ,"3" => 5 ,"4" => 4 ,"5" => 4 ,"6" => 3 ,"7" => 5 ,"8" => 5 ,"9" => 4 }
  teens = {"10" => 3 ,"11" => 6 ,"12" => 6 ,"13" => 8 ,"14" => 8 ,"15" => 7 ,"16" => 7 ,"17" => 9 ,"18" => 8 ,"19" => 8 }
  tens = {"2" => 6 ,"3" => 6 ,"4" => 5 ,"5" => 5 ,"6" => 5 ,"7" => 7 ,"8" => 6 ,"9" => 6 }
  hundred = {"100" => 7, "101" => 10}
  arr_int = (1..999).map {|num| num.to_s }
  count = 11

  arr_int.each do |number|
    if number.length == 3 && number[1] == "0" && number[2] == "0"
      count += single[number[0]] + hundred["100"]
    elsif number.length == 3 && number[1] == "0"
      count += single[number[0]] + hundred["101"] + single[number[2]]
    elsif number.length == 3 && number[1] == "1"
      count += single[number[0]] + hundred["101"] + teens[number[1..2]]
    elsif number.length == 3 && number[2] != "0"
      count += single[number[0]] + hundred["101"] + tens[number[1]] + single[number[2]]
    elsif number.length == 3 && number[2] == "0"
      count += single[number[0]] + hundred["101"] + tens[number[1]]
    elsif number.length == 2 && number[0] == "1"
      count += teens[number[0..1]]
    elsif number.length == 2 && number[1] == "0"
      count += tens[number[0]]
    elsif number.length == 2
      count += tens[number[0]] + single[number[1]]
    elsif number.length == 1
      count += single[number[0]]
    end
  end
  return count
end

# puts number_letter_count(1000)

################### EIGHTEEN PROBLEM ############
triangle_str = <<EOS
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOS

triangle = triangle_str.each_line.map { |line| line.split.map(&:to_i) }

# print triangle

############# NINETEENTH PROBLEM ############

require "date"
# puts Date.new(1901,1,1).upto(Date.new(2000,12,31)).find_all { |d| d.mday == 1 && d.wday == 0 }.count

############ TWENTYTH PROBLEM ##############

def factorial_sum(n)
  sum = 0
  result  = (1..n).map {|num| num }.reduce(:*)
  result.to_s.each_char {|char| sum += char.to_i }
  return sum
end

# puts factorial_sum(100)

########## TWENTY-FIRST ############


def amicable_number(range)
  sum = 0
  (1...range).each do |num|
    divisors = sum_of_divisors(num)
    reverse = sum_of_divisors(divisors)
    if reverse == num && num != divisors
      sum += num
    end
  end
  return sum
end

def sum_of_divisors(n)
  return (1...n).select {|divisor| n % divisor == 0}.reduce(0,:+)
end

# puts amicable_number(10000)

############## TWENTY-SECOND ###########

def name_score(file)
  #
end

############ TWENTY-THIRD ##########


def abundant?(num)
  num_for_while = num
  arr = []
  i = 1
  while i < num
    if num % i == 0
      arr << i
    end
    i += 1
  end
  return arr.reduce(:+) > num
end

def non_abundant_sum(num)
  abundants = (2..num).select {|n| abundant?(n) }
  sums = []
  abundants.each do |x,idx1|
    abundants.each do |y,idx2|
      sum = x + y
      sums << sum
    end
  end
  sums.uniq!
  return (1..28213).reject { |num| sums.include?(num) }.reduce(:+)
end

# puts non_abundant_sum(28123)

############ 24th #############
# puts (0..9).to_a.permutation(10).to_a[999999].join

############ 25th #############

def fibonacci_digit(n)
  n1, n2 = 1, 2
  i = 3
  until n2.to_s.length == n
    n1, n2 = n2, n1 + n2
    i += 1
  end

  return i
end

# puts fibonacci_digit(1000)

############ 26th ##########

def cycle_size(n,d)
  (10**n % d) == 1
end

def reciprocal_cycle(range)
  hash = {}
  (0..range).each do |d|
    hash[d] = (1..d).detect(lambda{0}) {|n| cycle_size(n,d) }
  end
  sorted = hash.sort_by {|k,v| v }
  return sorted[-1][0]
end

# puts reciprocal_cycle(1000)

############ 27th #############

# class Integer
#   def prime?
#     self > 1 && !(2..Math.sqrt(self)).any? { |i| self % i == 0 }
#   end
# end
#
#
# def count_quadratic_formula_primes(a,b)
#   (0..Float::INFINITY).take_while { |n| (n**2 + a*n + b).prime? }.count
# end
#
# def product_of_coefficients_that_produce_maximum_number_of_primes_for_consecutive_values()
# a, b = (-999..1000).to_a.repeated_permutation(2).max_by { |a, b| count_quadratic_formula_primes(a,b) }
# a * b
# end
#
#
# answer = product_of_coefficients_that_produce_maximum_number_of_primes_for_consecutive_values
#
# puts "The answer is #{answer}"

# puts (-999..999).to_a.product((-999..999).to_a).map { |a, b|
#   [(0..100).take_while { |n| (n**2 + a*n + b).prime? }.count, a * b]
# }.max[1]

############ 28th #############

def spiral_diagonals(r)
  i = 1
  step = 2
  sum = 0
  cycle = 0
  until i > r**2
    if cycle == 4
      cycle = 0
      step += 2
    end
    cycle += 1
    sum += i
    i += step
  end
  return sum
end

# puts spiral_diagonals(1001)

############ 29th #############

def distinct_powers(x,y)
  arr = []
  (x..y).each_with_index do |num,idx1|
    (x..y).each_with_index do |power,idx2|
        arr << num**power
    end
  end
  return arr.uniq!.length
end

# puts distinct_powers(2,100)

########### 30th ############

def digit_power(power)
  arr   = (2..1000000).select do |num|
    num == num.to_s.each_char.map {|char| char.to_i**power }.reduce(:+)
  end
  return arr.reduce(:+)
end

# puts digit_power(5)



# LinkedIn  https://www.linkedin.com/in/croquevaldes/