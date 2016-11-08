require 'transform_word'

describe TransformWord do
  context 'when building the graph' do
    let(:dictionary) { ['cat', 'at', 'bat', 'ed', 'bed', 'bet', 'ad'] }
    let(:graph) { subject.build_graph(dictionary) }

    it 'returns a graph with appropriate size' do
      expect(graph.size).to eq dictionary.size
      expect(graph[0].size).to eq dictionary.size
    end

    it 'has 8 links' do
      count = graph.reduce(0) do |result, line|
        result + line.count { |item| item == true }
      end

      expect(count).to eq 16
    end

    it 'links "cat" and "at"' do
      expect(linked?('cat', 'at')).to be true 
    end
    
    it 'links "at" and "bat"' do
      expect(linked?('at', 'bat')).to be true
    end
    
    it 'links "ed" and "bed"' do
      expect(linked?('ed', 'bed')). to be true
    end
    
    it 'links "cat" and "bat"' do
      expect(linked?('cat', 'bat')).to be true
    end

    it 'links "bat" and "bet"' do
      expect(linked?('bat', 'bet')).to be true
    end

    it 'links "bet" and "bed"' do
      expect(linked?('bet', 'bed')).to be true
    end

    it 'links "at" and "ad"' do
      expect(linked?('at', 'ad')).to be true
    end

    it 'links "ad" and "ed"' do
      expect(linked?('ad', 'ed')).to be true
    end
  end
  
  def linked?(w1, w2)
    index_w1 = dictionary.find_index(w1)
    index_w2 = dictionary.find_index(w2)

    graph[index_w1][index_w2] && graph[index_w2][index_w1]
  end
end
