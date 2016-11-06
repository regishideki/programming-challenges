class FindMissingElement
  def find(array1, array2)
    (array1 + array2).reduce { |result, element| result ^ element }
  end
end
