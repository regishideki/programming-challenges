Point = Struct.new(:x, :y)

class MatrixRegionSum
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

  def sum(matrix, top_left, bottom_right)
    unless @cache
      @cache = pre_compute(matrix)
    end

    initial_to_bottom_right(top_left, bottom_right) - 
    initial_to_top_right(top_left, bottom_right) - 
    initial_to_bottom_left(top_left, bottom_right) + 
    initial_to_top_left(top_left, bottom_right)
  end

  private

  def initial_to_bottom_right(top_left, bottom_right)
    @cache[bottom_right.x][bottom_right.y]
  end

  def initial_to_top_right(top_left, bottom_right)
    return 0 if top_left.y == 0

    @cache[bottom_right.x][top_left.y - 1]
  end

  def initial_to_bottom_left(top_left, bottom_right)
    return 0 if top_left.x == 0

    @cache[top_left.x - 1][bottom_right.y]
  end

  def initial_to_top_left(top_left, bottom_right)
    return 0 if top_left.x == 0 || top_left.y == 0

    @cache[top_left.x - 1][top_left.y - 1]
  end
end