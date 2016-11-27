require 'set'

class AllPermutationsOfString
  def all_permutations(string)
    return [string] if string.size == 1

    permutations = all_permutations(string[1..-1])
    char = string[0]

    permutations.each_with_object(Set.new([])) do |permutation, result|
      (permutation.size + 1).times do |n|
        result << permutation[0...n] + char + permutation[n..-1]
      end
    end
  end
end
