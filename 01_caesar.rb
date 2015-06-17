def upcase_char?(char)
	/[A-Z]/ =~ (char)
end

def caesar_cipher(user_string, shift)
	abc_array = ('a'..'z').to_a
	shift -= abc_array.size if shift > abc_array.size
	new_user_string = user_string.dup
	user_string.scan(/[a-z]/i) do |char|
		letter_num = abc_array.find_index(char.downcase)
		puts "#{letter_num}: '#{char}'"
		letter_num -= shift
		new_char = abc_array[letter_num]
		new_char.upcase! if upcase_char?(char)
		new_user_string[$~.offset(0)[0]] = new_char
	end
	new_user_string
end

puts "New string #{caesar_cipher("!av I123  <>?k", 2)}"
#"!qrS123<>?v"

puts "New string: #{caesar_cipher("Abcdefg!", 1)}"
#"Zabcdef!"

puts "New string: #{caesar_cipher("What a string!", 5)}"
#Mysteriously find_index returns nil on the 'r'...