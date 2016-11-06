require 'combine_two_strings'

describe CombineTwoStrings do
  context 'when 3th string has 1st and 2nd ones in order' do
    it 'is valid' do
      expect(subject.valid?('abc', '123', 'abc123')).to be true
    end
  end

  context 'when 3th string has not 1st and 2nd ones in order' do
    it 'is not valid' do
      expect(subject.valid?('abc', '123', 'abc132')).to be false
    end
  end
end
