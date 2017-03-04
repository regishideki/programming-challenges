require 'array_sum_pair'

describe ArraySumPair do 
  context 'when there is only one pair' do 
    it 'retuns the pair if the sum of pair is equal the value provided' do 
      expect(subject.pairs([3, 1], 4)).to contain_exactly([1, 3])
    end
  end

  context 'when more than a pair' do 
    it 'returns the pair when the sum of the pair is equal the value provided' do
      expect(subject.pairs([3, 1, 0], 4)).to contain_exactly([1, 3])
    end

    it 'returns the pairs such sum is equal the value provided' do 
      expect(subject.pairs([3, 1, 0, 4], 4)).to contain_exactly([1, 3], [0, 4])
    end

    it 'does not repeat the array' do 
      expect(subject.pairs([3, 1, 1, 3], 4)).to contain_exactly([1, 3])
    end

    it 'does not use same number twice' do
      expect(subject.pairs([3, 2, 3], 4)).not_to include([2, 2])
    end
  end
end