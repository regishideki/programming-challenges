class LargestContinuousSum
  def largest_sum(array)
    return 0 if array.empty?

    max_sum = current_sum = array[0]

    array[1..-1].reduce(max_sum) do |max_sum, element|
      current_sum = [current_sum + element, element].max
      [current_sum, max_sum].max
    end   
  end
end
