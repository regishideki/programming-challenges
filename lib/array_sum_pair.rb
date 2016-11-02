require 'set'

class ArraySumPair
  def pairs(elements, target)
    elements = elements.sort

    left = 0
    right = elements.size - 1

    result = Set.new([])

    while left < right do
      sum = elements[left] + elements[right]
      if sum == target
        result << [elements[left], elements[right]]
        left += 1
      elsif sum < target
        left += 1
      else
        right -= 1
      end 
    end

    result 
  end
end