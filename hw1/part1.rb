def palindrome?(str)
  str = str.downcase.gsub(/\W/, '')
  str == str.reverse
end

def count_words(str)
  counts = {}
  str.scan(/\w+/).each do |w|
    w.downcase!
    counts[w] ? counts[w] += 1 : counts[w] = 1
  end
  counts
end