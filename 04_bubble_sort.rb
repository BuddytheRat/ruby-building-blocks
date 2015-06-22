def bubble_sort_by(array)
	sorts = 0
	array.size.times do
		sorts += 1
		left_to_sort = array.size - sorts
		left_to_sort.times do |i|
			compare = yield(array[i], array[i+1])
			if compare < 0
				array[i], array[i+1] = array[i+1], array[i]
			end
		end
	end
	array
end

def bubble_sort(array)
	bubble_sort_by(array) { |x, y| y - x }
end

puts bubble_sort([4, 3, 78, 2, 0, 2])
#=> [0, 2, 2, 3, 4, 78]

sorted = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	right.length - left.length
end
puts sorted
#=> ["hi", "hey", "hello"]