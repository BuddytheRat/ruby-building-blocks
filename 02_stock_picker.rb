def stock_picker(price_array)
	diff = 0
	buy = 0
	sell = 0
	price_array.each_with_index do |buy_day, i|
		price_array.each_with_index do |sell_day, j|
			next if j <= i #skip previous/current days
			current_diff = sell_day - buy_day
			if current_diff > diff
				diff = current_diff
				buy = i
				sell = j
			end
		end
	end
	"#{[buy, sell]}, #{price_array[sell]} - #{price_array[buy]}, Profit of: #{diff}"
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
#=> [1, 4]