class CombineTwoStrings
  def valid?(s1, s2, s3)
    if s1.empty? || s2.empty?
      return s1 + s2 == s3
    end

    if s1[0] == s3[0] 
      return valid?(s1[1..-1], s2, s3[1..-1])   
    end

    if s2[0] == s3[0]
      return valid?(s1, s2[1..-1], s3[1..-1])
    end

    false
  end
end
