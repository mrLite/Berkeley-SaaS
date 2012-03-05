class String
  def palindrome?
    self.downcase.gsub(/\W/, '') == self.downcase.gsub(/\W/, '').reverse
  end
end

module Enumerable
  def palindrome?
    self.each_index { |i| return false unless self[i] == self[-i-1] }
    true
  end
end