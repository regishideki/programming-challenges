require 'binary_search_tree_check'

describe BinarySearchTreeCheck do
  context 'when checking if is a binary seach tree' do
    it 'returs true when is a BST' do
      tree = {
        value: 6,
        left: {
          value: 4,
          left: { value: 3 },
          right: { value: 5 },
        },
        right: {
          value: 9,
          left: { value: 7 },
          right: { value: 10 }
        }
      }

      expect(subject.bst?(tree)).to be true
    end

    it 'returns true when is a BST with repetition' do
      tree = {
        value: 6,
        left: {
          value: 6,
          left: { value: 5 },
          right: { value: 5 },
        },
        right: {
          value: 9,
          left: { value: 9 },
          right: { value: 10 }
        }
      }
                                            
      expect(subject.bst?(tree)).to be true
    end
    
    it 'returns false when is not a BST' do
      tree = {
        value: 3,
        left: {
          value: 2,
          left: { value: 1 },
          right: { value: 4 }
        },
        right: { value: 5 }
      }

      expect(subject.bst?(tree)).to be false
    end 
  end
end
