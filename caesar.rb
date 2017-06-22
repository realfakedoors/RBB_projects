#Caesar's Cipher Exercise
#http://www.theodinproject.com/courses/ruby-programming/lessons/building-blocks

#A simple character shift method.

def char_shift(char, ascii_start, shift)
  
  #we'll convert each letter to an index from 0-25.
  char_index = char.ord - ascii_start
  
  #then we shift the index, looped in the range of 0-25.
  char_index = (char_index + shift) % 26
  
  #finally, we'll convert each index back into an alphabetic character:
  char = (char_index + ascii_start).chr
  
end

#A method for encoding using Caesar's Cipher.

def encoder(text, shift)
  
  #first we convert the shift factor to an equivalent upshift if it happens to be negative:
  
  shift = shift.to_i
  
  until (shift >= 0)
    
    shift = shift + 26
    
  end
  
  #then we shift each letter, keeping the case and ignoring any non-letter characters:
  
  newtext = ""
  
  text.to_s.each_char do |letter|
    
    case letter
    when /[A-Z]/
      newtext << char_shift(letter, "A".ord, shift)
    when /[a-z]/
      newtext << char_shift(letter, "a".ord, shift)
    else
      newtext << letter
    end
    
  end
  
  puts newtext
  
end

puts "Enter a phrase to encode using Caesar's Cipher:"
text = gets.chomp.to_s

puts "How many letters would you like to shift?"
shift = gets.chomp.to_i

encoder(text, shift)