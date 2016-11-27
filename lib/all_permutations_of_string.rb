require 'set'

class AllPermutationsOfString
  def all_permutations(string)
    if string.size == 1
      return [string]
    end

    permutations = all_permutations(string[1..-1])
    char = string[0]

    result = Set.new([])

    permutations.each do |permutation|
      (permutation.size + 1).times do |n|

        result << permutation[0...n] + char + permutation[n..-1]
      end
    end

    result
  end
end
