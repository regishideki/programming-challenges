class FindMissingElement
  def find(array1, array2)
    array1.sort!
    array2.sort!
    # just to not raise exception in last iteration
    array2 << nil
    
    for i in (0..array1.size) do
      return array1[i] if array1[i] != array2[i]
    end
  end
end
