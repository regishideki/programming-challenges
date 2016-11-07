class TransformWord
  def build_graph(dictionary)
    graph = Array.new(dictionary.size) { Array.new(dictionary.size) }
    
    dictionary.each do |word|
      word.size.times do |i|
#        require 'pry'; binding.pry
        word_without_one_character = without_one_character(word, i) 
        if dictionary.include?(word_without_one_character)
          index_word = dictionary.find_index(word)
          index_word_without_one_character = dictionary.find_index(word_without_one_character)

          graph[index_word][index_word_without_one_character] = true
          graph[index_word_without_one_character][index_word] = true
        end
      end
    end
    
    graph
  end

  def without_one_character(word, char_index_removed)
    word[0...char_index_removed] + word[char_index_removed + 1..-1]
  end
end
