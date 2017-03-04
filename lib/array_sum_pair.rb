require 'set'

class ArraySumPair
  def pairs(numbers, target)
    result = Set.new([])
    seen = Set.new([])

    numbers.each do |number|
      current_target = target - number
      if seen.include?(current_target)
        result.add([
          [number, current_target].min, 
          [number, current_target].max
        ])
      else
        seen << number
      end
    end

    result
  end
end