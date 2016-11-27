require 'all_permutations_of_string'

describe AllPermutationsOfString do
  context 'when finding all permutations' do
    context 'when there is only one character' do
      it { expect(subject.all_permutations('a')).to match_array ['a'] }
    end

    context 'when there are two characters' do
      it { expect(subject.all_permutations('ab')).to match_array ['ab', 'ba'] }
    end

    context 'when there are three characters' do
      it { expect(subject.all_permutations('abc')).to match_array ['abc', 'acb', 'bac', 'bca', 'cab', 'cba'] }
    end

    context 'when there are four characters' do
      it { expect(subject.all_permutations('abcd')).to match_array ['abcd', 'abdc', 'acbd', 'acdb', 'adbc', 'adcb',
                                                                    'bacd', 'badc', 'bcad', 'bcda', 'bdac', 'bdca',
                                                                    'cabd', 'cadb', 'cbad', 'cbda', 'cdab', 'cdba',
                                                                    'dabc', 'dacb', 'dbac', 'dbca', 'dcab', 'dcba']}
    end

    context 'when there are repeated characters' do
      it { expect(subject.all_permutations('aba')).to match_array ['aab', 'aba', 'baa'] }
    end
  end
end
