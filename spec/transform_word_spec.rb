require 'transform_word'

describe TransformWord do
  context 'when building the graph' do
    let(:dictionary) { ['cat', 'at', 'bat', 'ed', 'bed', 'bet', 'ad'] }
    let(:graph) { subject.build_graph(dictionary) }

    it 'has 8 links' do
      count = graph.to_a.reduce(0) do |result, line|
        result + line.count { |item| item == true }
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
end
