class CartesianProduct
  include Enumerable
  attr_reader :product
  
  def initialize(arr1 = [], arr2 = [])
    @product = []
    arr1.each do |elem1|
      arr2.each {|elem2| @product << [elem1, elem2] }
    end
    @product
  end
  
  def each
    @product.each {|n| yield n }
  end
end