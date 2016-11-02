require 'matrix_region_sum'

describe MatrixRegionSum do 
  context 'when pre computing' do
    context 'when pre computing a 1x1 matrix' do
      it 'return a new matrix with all the sums between point (0, 0) and the column itself' do 
        matrix = [
          [10]
        ]

        expect(subject.pre_compute(matrix)).to eq [[10]]
      end
    end

    context 'when pre computing a 2x2 matrix' do
      it 'return a new matrix with all the sums between point (0, 0) and the column itself' do 
        matrix = [
          [1, 2], 
          [3, 4]
        ]

        expect(subject.pre_compute(matrix)).to eq [[1, 3], [4, 10]]
      end
    end

    context 'when pre computing a 3x3 matrix' do
      it 'return a new matrix with all the sums between point (0, 0) and the column itself' do 
        matrix = [
          [1, 2, 10], 
          [3, 4, 100],
          [5, 6, 1000]
        ]

        expect(subject.pre_compute(matrix)).to eq [[1, 3, 13], [4, 10, 120], [9, 21, 1131]]
      end
    end
  end

  context 'when calculating the sum' do
    context 'when the region is all the matrix' do 
      it 'returns the sum of all numbers' do 
        matrix = [
          [1, 2], 
          [3, 4]
        ]

        top_left = Point.new(0, 0)
        bottom_right = Point.new(1, 1)

        expect(subject.sum(matrix, top_left, bottom_right)).to eq 10
      end
    end

    context 'when the region is not all the matrix' do 
      it 'return the sum of the region' do 
        matrix = [
          [1, 2, 3], 
          [3, 4, 5]
        ]

        top_left = Point.new(0, 0)
        bottom_right = Point.new(1, 1)

        expect(subject.sum(matrix, top_left, bottom_right)).to eq 10
      end
    end
  end
end