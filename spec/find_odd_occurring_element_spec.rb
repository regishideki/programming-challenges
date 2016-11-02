require 'find_odd_occurring_element'

describe FindOddOccurringElement do 
  context 'when there is only one element' do 
    it 'returns the element itself' do 
      expect(subject.find([9])). to eq 9
    end
  end

  context 'when there are more than one element' do
    it 'return the odd element when it is the first one' do 
      expect(subject.find([1, 5, 8, 7, 8, 5, 9, 9, 7])).to eq 1
    end

    it 'return the odd element when it is the last one' do 
      expect(subject.find([7, 5, 8, 7, 8, 5, 9, 9, 1])).to eq 1
    end

    it 'return the odd element when it is in the middle' do 
      expect(subject.find([7, 5, 8, 7, 1, 5, 9, 9, 8])).to eq 1
    end

    it 'return the odd element even when there are negative numbers' do 
      expect(subject.find([7, 5, -8, 7, 1, 5, 9, 9, -8])).to eq 1
    end

    it 'return the odd element even when it is negative' do 
      expect(subject.find([7, 5, -8, 7, -1, 5, 9, 9, -8])).to eq -1
    end
  end 
end