class BinarySearchTreeCheck
  def initialize
    @current_element = -999999999999999
  end

  def bst?(tree)
    if tree[:left]
      bst?(tree[:left])
    end

    if tree[:value] < @current_element
      return false
    else
      @current_element = tree[:value]
    end

    if tree[:right]
      bst?(tree[:right])
    end
    
    true
  end
end
