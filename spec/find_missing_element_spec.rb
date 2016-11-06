require 'find_missing_element'

describe FindMissingElement do
  context 'when there is no duplication' do
    it 'returns the missing element' do
      expect(subject.find([4, 7, 1], [7, 4])).to eq 1
    end
  end

  context 'when there are duplications' do
    it 'returns the missing element' do
      expect(subject.find([5, 4, 7, 1, 1], [7, 4, 1, 5])).to eq 1
    end
  end
end
