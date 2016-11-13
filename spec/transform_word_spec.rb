require 'transform_word'

describe TransformWord do
  let(:dictionary) { ['cat', 'at', 'bat', 'ed', 'bed', 'bet', 'ad', 'test'] }
  let(:graph) { subject.build_graph(dictionary) }

  context 'when building the graph' do
    it 'has 8 pairs of links' do
      count = graph.to_h.reduce(0) do |result, (_, array)|
        result + array.size
      end

      expect(count).to eq 16
    end

    it 'links "cat" and "at"' do
      expect(graph.linked?('cat', 'at')).to be true 
    end
    
    it 'links "at" and "bat"' do
      expect(graph.linked?('at', 'bat')).to be true
    end
    
    it 'links "ed" and "bed"' do
      expect(graph.linked?('ed', 'bed')). to be true
    end
    
    it 'links "cat" and "bat"' do
      expect(graph.linked?('cat', 'bat')).to be true
    end

    it 'links "bat" and "bet"' do
      expect(graph.linked?('bat', 'bet')).to be true
    end

    it 'links "bet" and "bed"' do
      expect(graph.linked?('bet', 'bed')).to be true
    end

    it 'links "at" and "ad"' do
      expect(graph.linked?('at', 'ad')).to be true
    end

    it 'links "ad" and "ed"' do
      expect(graph.linked?('ad', 'ed')).to be true
    end
  end

  context 'when trying to find smallest path between two words' do 
    it 'returns an empty path when there is not path between start and goal' do 
      expect(graph.smallest_path('at', 'test')).to be_empty
    end

    it 'returns smallest path when start and goal are equal' do 
      expect(graph.smallest_path('at', 'at')).to eq ['at']
    end

    it 'return smallet path when start and goal are neighbors' do 
      expect(graph.smallest_path('at', 'cat')).to eq ['at', 'cat']
    end

    it 'returns smallet path when start and goal are far from each other' do 
      expect(graph.smallest_path('cat', 'bed')).to eq ['cat', 'bat', 'bet', 'bed']
    end
  end
end
