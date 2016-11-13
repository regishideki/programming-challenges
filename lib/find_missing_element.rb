class FindMissingElement
  def find(array1, array2)
    (array1 + array2).reduce(:^)
  end
end
