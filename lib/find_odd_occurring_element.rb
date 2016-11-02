class FindOddOccurringElement
  def find(elements)
    elements.reduce { |item, result| item ^ result }
  end
end