class Array
  def deep_map(&block)
    self.map do |element|
      if element.is_a?(Array)
        element.deep_map(&block)
      else
        yield(element)
      end
    end
  end
end
  