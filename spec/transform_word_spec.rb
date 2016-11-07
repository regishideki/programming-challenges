require 'transform_word'

describe TransformWord do
  context 'when building the graph' do
    let(:dictionary) { ['cat', 'at'] }
    let(:graph) { subject.build_graph(dictionary) }

    it 'returns a graph with appropriate size' do
      expect(graph.size).to eq dictionary.size
      expect(graph[0].size).to eq dictionary.size
    end

    it 'it links cat to at' do
      expect(graph[0][1]).to eq true
      expect(graph[1][0]).to eq true
    end
  end
end
