# SUBSTRINGS
# This program takes a string and an array as arguments, checks whether
# the array contains the string, then records how many times it was found
# in a hash.

def substrings(word, substring_array)
  
# First we'll create a new hash to store our occurrences of each word.
  
  frequencies = Hash.new(0)
  
# Then we take our input string and turn it into an array so we can check
# each word against our input array, one at a time. Sanitizing our input is
# important here, so we'll pass a regex into our split that filters out 
# any annoying parentheses, commas or whitespace:
  
  word = word.split(%r{\(\),\s*})
  
# Then we'll use nested iteration to check each element in our new 'word'
# array against each element in our 'substring' array, and store any matches
# we find in our 'frequencies' hash:
  
  word.each do |word|
    substring_array.each do |substring|
      if word.include? substring
      frequencies[substring] += 1
      end
    end
  end
  
# We'll sort our frequencies hash for readability's sake using $sort_by:
  
  frequencies = frequencies.sort_by do
    |substring, frequencies|
    frequencies
  end
  
  frequencies.reverse!
  
# Then we print a readable summary of our frequencies hash:
  
  frequencies.each do
    |substring, frequencies|
    puts substring + " " + frequencies.to_s
  end
  
  frequencies
  
end

# Let's check it out using a sample from the GREATEST SONG EVER WRITTEN:

substrings("I did it all for the Nookie, (come on), the Nookie, (come on),
yeah", ["Nookie","Cookie","Limp Bizkit","yeah","come on"])