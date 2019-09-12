def largest_palindrome(n)
    pali_arr = []
    b = n / 2
    (b..n).each_with_index do |num,idx|
      (b..n).each_with_index do |num2,idx2|
        if idx2 > idx && palindrome(num * num2)
          pali_arr << num * num2
        end
      end
    end
    sorted_arr = pali_arr.sort_by {|num,idx| num }
    return sorted_arr[-1]
  end
  
  def palindrome(num)
    num_arr = num.to_s.split("")
    return num_arr == num_arr.reverse
  end
  
  # puts largest_palindrome(9999)