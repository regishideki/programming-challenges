class TransformWord
  LETTERS = ('a'..'z').to_a

  def build_graph(dictionary)
    dictionary.each_with_object(Graph.new) do |word, graph|
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

  def without_one_char(word, char_index_removed)
    word[0...char_index_removed] + word[(char_index_removed + 1)..-1]
  end
end

require 'set'

class Graph
  def initialize
    @hash = {}
  end

  def smallest_path(start, goal)
    paths = [[start]]
    extended = Set.new

    while paths.any?
      current_path = paths.shift
      current_word = current_path.last

      return current_path if current_word == goal

      next if extended.include?(current_word)

      extended << current_word

      neighbors(current_word).each do |word|
        paths << (current_path + [word]) unless current_path.include?(word)
      end
    end

    return []
  end

  def neighbors(word)
    hash[word]
  end

  def link_words(w1, w2)
    hash[w1] ||= Set.new
    hash[w2] ||= Set.new

    hash[w1] << w2
    hash[w2] << w1
  end

  def linked?(w1, w2)
    hash[w1].include?(w2) && hash[w2].include?(w1)
  end

  def to_h
    hash
  end

  private 

  attr_reader :hash
end