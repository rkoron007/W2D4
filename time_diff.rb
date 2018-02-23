
# MY_MIN

def my_min(arr)
  arr.each_with_index do |el1, idx1|
    smallest = true
    arr.each_with_index do |el2, idx2|
      next if idx1 == idx2
      smallest = false if el1 > el2
    end
    return el1 if smallest
  end
end

#Time complexity -> O[n^2]
#Space complexity -> O[n]

def best_my_min(arr)
  smallest = arr.shift
  arr.each do |el|
    smallest = el unless el > smallest
  end
  smallest
end

#Time complexity -> O[n]
#Space complexity -> O[1]

#LARGEST CONTIGUOUS SUB-SUM

def largest_contiguous_subsum(arr)
  sum = arr.first

  (0...(arr.length - 1)).each do |idx1|
    (idx1..(arr.length - 1)).each do |idx2|
      if idx1 == idx2
        ss = arr[idx1]
      else
        ss = arr[idx1..idx2].reduce(:+)
      end
      sum = ss if ss > sum
    end
  end
  sum
end

#Time complexity -> O[n^3]
#Space complexity -> O[n]

def best_largest_contiguous_subsum(arr)
  return arr.max if arr.max < 0
  largest = 0
  current = 0


  (0..(arr.length-1)).each do |idx1|
    if current + arr[idx1] < 0
      current = arr[idx1]
    else
      current += arr[idx1]
    end

    largest = current if current > largest
  end
  largest
end

#Time complexity -> O[n]
#Space complexity -> O[1]

# ANAGRAMS

def first_anagram?(str1, str2)
  str1.chars.to_a.permutation.map(&:join).include?(str2)
end

#Time complexity -> O[n!]
#Space complexity -> O[n!]

def second_anagram?(str1, str2)
  str1.chars.each do |char1|
    str2.chars.each do |char2|
      if char1 == char2
        str1.delete!(char1)
        str2.delete!(char2)
      end
    end
  end
  return true if str1.empty?
  false
end

#Time complexity -> O[n^2]
#Space complexity -> O[n]

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

#Time complexity -> O[nlog(n)]
#Space complexity -> O[n]


def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)

  str1.chars.each {|el| hash1[el] += 1}
  str2.chars.each {|el| hash1[el] += 1}

  hash1.each {|k,_| hash1[k].even? ? next : (return false) }
  true
end

#Time complexity -> O[n]
#Space complexity -> O[n]

def bad_two_sum?(arr, target)
  zero_sum = false
  arr.each_with_index do |el1, idx1|
    arr.drop(idx1).each do |el2|
      zero_sum = true if el1 + el2 == target
    end
  end
  zero_sum
end

#Time complexity -> O[n^2]
#Space complexity -> O[1]

def okay_two_sum?(arr, target)
  arr.sort!

  arr.select! { |el| el < target }

  arr.each { |el| arr.include?(target - el) ? (return true) : next }
  false
end

#Time complexity -> O[n]
#Space complexity -> O[n]


def two_sum?(arr, target)
  sum_hash = {}

  arr.each do |el|
    sum_hash[el] = (target-el)
    return true if sum_hash[target-el]
  end

  false
end

#Time complexity -> O[n]
#Space complexity -> O[n]

def windowed_max_range(arr, range)
  current_max_range = nil

  arr.each_index do |idx|
    idx2 = idx + range
    break if idx2 > (arr.length - 1)
    window = arr[idx..idx2]
    p diff = window.max - window.min
    current_max_range = diff if current_max_range.nil? || diff > current_max_range
  end
  current_max_range
end

"little change"
