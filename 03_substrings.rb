def substrings(string, dict)
	substr_count = Hash.new(0)
	string_array = string.split
	string_array.each do |word|
		dict.each do |substr|
			substr_count[substr] += 1 if /#{substr}/ =~ word
		end
	end
	substr_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
# => {"below"=>1, "low"=>1}

puts substrings("Howdy partner, sit down! How's it going?", dictionary)