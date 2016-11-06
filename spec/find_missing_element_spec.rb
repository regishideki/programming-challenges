require 'find_missing_element'

describe FindMissingElement do
  context 'when there is no duplication' do
    it 'returns the missing element' do
      expect(subject.find([4, 7, 1], [7, 4])).to eq 1
    end
  end
end
