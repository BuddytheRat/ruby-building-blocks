def bubble_sort(array)
	new_array = array
	sorts = 0
	new_array.size.times do
		sorts += 1
		left_to_sort = new_array.size - sorts
		left_to_sort.times do |i|
			if new_array[i] > new_array[i+1]
				new_array[i], new_array[i+1] = new_array[i+1], new_array[i]
			end
		end
	end
	new_array
end

puts bubble_sort([4, 3, 78, 2, 0, 2])
#=> [0, 2, 2, 3, 4, 78]

def bubble_sort_by(array)
	
end

bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	right.length - left.length
end
#=> ["hi", "hey", "hello"]