require 'largest_continuous_sum'

describe LargestContinuousSum do
  context 'when passing an empty array' do
    it 'returns 0' do
      expect(subject.largest_sum([])).to eq 0
    end
  end

  context 'when passing only positive numbers' do
    it 'return the sum of all elements' do
      expect(subject.largest_sum([1, 2, 3, 4])).to eq 10
    end
  end

  context 'when passing only negative numbers' do
    it 'returns the greater element' do
      expect(subject.largest_sum([-10, -2, -3, -4])).to eq -2
    end
  end

  context 'when passing positive and negative numbers' do
    it 'ignores initial when initial is negative' do
      expect(subject.largest_sum([-1, -2, 1, 2, 3])).to eq 6
    end
    
    it 'ignores final when final is negative' do
      expect(subject.largest_sum([1, 2, 3, -1, -2])).to eq 6
    end
    
    it 'chooses the largest sum when there is a great negative number in the middle' do
      expect(subject.largest_sum([1, 2, 3, -5, 1, 2])).to eq 6
    end

    it 'sum all numbers when the negative numbers in the middle is smaller than the sum of positive numbers in the final' do
      expect(subject.largest_sum([1, 2, 3, -1, -2, 4])).to eq 7
    end
  end
end
