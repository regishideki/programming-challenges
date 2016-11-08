class TransformWord
  LETTERS = ('a'..'z').to_a

  def build_graph(dictionary)
    graph = Array.new(dictionary.size) { Array.new(dictionary.size) }
    
    dictionary.each do |word|
      word.size.times do |i|
        word_without_one_char = without_one_char(word, i) 
        index_word = dictionary.find_index(word)
        
        if dictionary.include?(word_without_one_char)
          index_word_without_one_char = dictionary.index(word_without_one_char)
          
          unless index_word_without_one_char.nil?
            graph[index_word][index_word_without_one_char] = true
            graph[index_word_without_one_char][index_word] = true
          end
        end
        
        LETTERS.each do |letter|
          word_with_one_char_changed = word_without_one_char.dup.insert(i, letter)
          index_word_with_one_char_changed = dictionary.index(word_with_one_char_changed)

          if index_word_with_one_char_changed && word_with_one_char_changed != word 
            graph[index_word][index_word_with_one_char_changed] = true
            graph[index_word_with_one_char_changed][index_word] = true  
          end 
        end
      end
    end
    
    graph
  end

  def without_one_char(word, char_index_removed)
    word[0...char_index_removed] + word[char_index_removed + 1..-1]
  end
end
