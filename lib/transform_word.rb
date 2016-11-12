class TransformWord
  LETTERS = ('a'..'z').to_a

  def build_graph(dictionary)
    dictionary.each_with_object(Graph.new(dictionary)) do |word, graph|
      word.size.times do |char_index|
        word_without_one_char = without_one_char(word, char_index) 
        
        if dictionary.include?(word_without_one_char)
          graph.link_words(word, word_without_one_char)
        end
        
        LETTERS.each do |letter|
          word_with_one_char_changed = word_without_one_char.dup.insert(char_index, letter)

          if dictionary.include?(word_with_one_char_changed) && word_with_one_char_changed != word 
            graph.link_words(word, word_with_one_char_changed)
          end 
        end
      end
    end
  end

  private

  def link_words(graph, index_word_1, index_word_2)
    graph[index_word_1][index_word_2] = graph[index_word_2][index_word_1] = true
  end

  def without_one_char(word, char_index_removed)
    word[0...char_index_removed] + word[(char_index_removed + 1)..-1]
  end
end

class Graph
  def initialize(dictionary)
    @dictionary = dictionary
    @graph = Array.new(dictionary.size) { Array.new(dictionary.size) }
  end

  def link_words(w1, w2)
    index_w1 = dictionary.find_index(w1)
    index_w2 = dictionary.find_index(w2)

    graph[index_w1][index_w2] = graph[index_w2][index_w1] = true
  end

  def linked?(w1, w2)
    index_w1 = dictionary.find_index(w1)
    index_w2 = dictionary.find_index(w2)

    graph[index_w1][index_w2] && graph[index_w2][index_w1]
  end

  def to_a
    @graph
  end

  private 

  attr_reader :graph, :dictionary
end