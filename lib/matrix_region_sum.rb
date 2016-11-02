Point = Struct.new(:x, :y)

class MatrixRegionSum
  def sum(matrix, top_left, bottom_right)
    unless @cache
      @cache = pre_compute(matrix)
    end

    initial_to_bottom_right = @cache[bottom_right[0]][bottom_right[1]]

    initial_to_top_right = @cache[bottom_right[0]][top_left[1] - 1]
    initial_to_bottom_left = @cache[top_left[0] - 1][bottom_right[1]]
    initial_to_top_left = @cache[top_left[0] - 1][top_left[1] - 1]

    initial_to_top_right - initial_to_top_right - initial_to_bottom_left + initial_to_top_left
  end

  def pre_compute(matrix)
    result = Array.new(matrix.size) { Array.new(matrix[0].size) }

    matrix.each_with_index do |line, x|
      line.each_with_index do |column, y|
        result[x][y] = matrix[x][y]

        if x > 0
          result[x][y] += result[x - 1][y]
        end

        if y > 0
          result[x][y] += result[x][y - 1]
        end

        if x > 0 && y > 0
          result[x][y] -= result[x - 1][y - 1]
        end
      end
    end

    result
  end
end