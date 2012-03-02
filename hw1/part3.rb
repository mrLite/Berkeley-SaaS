def combine_anagrams(words)
  groups = []
  
  words.each do |w|
    w = w.downcase.split(//).sort.join
    anagrams = words.collect { |a| a if a.downcase.split(//).sort.join == w }
    groups << anagrams.compact.sort
  end
  groups.uniq
end