def combine_anagrams(words)
  groups = []
  
  words.each do |w|
    w = w.downcase.split(//).sort.join
    anagrams = words.collect { |a| a if a.downcase.split(//).sort.join == w }
    groups << anagrams.compact.sort
  end
  groups.uniq
end

# def combine_anagrams(words)
#   anagram_list = {}
#   words.each {|word| anagram_list[word.downcase.split(//).sort.join] = [] unless anagram_list.has_key? word.downcase.split(//).sort.join }
#   words.each {|w| anagram_list[w.downcase.split(//).sort.join] << w }
#   anagram_list.collect {|k,v| v}
# end