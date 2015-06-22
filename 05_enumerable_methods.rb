module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		return self
	end
	def my_each_with_index
		i = 1
		self.my_each do |item|
			yield(i, item)
			i+= 1
		end
		return self
	end
	def my_select
		selected = []
		self.my_each do |i|
			if (yield(i))
				selected << i
			end
		end
		return selected
	end
	def my_all?
		all_is_true = true
		self.my_each do |i|
			if !(yield(i))
				all_is_true = false 
				break
			end
		end
		return all_is_true
	end
	def my_any?
		any_is_true = false
		self.my_each do |i|
			any_is_true = true if (yield(i))
		end
		return any_is_true
	end
	def my_none?
		return !(self.my_any? { |i| yield(i) })
	end
	def my_map #skipped step 14 here, because confused
		mapped = []
		self.my_each do |i|
			mapped << yield(i)
		end
		return mapped
	end
	def my_inject(memo = self[0])
		self.my_each_with_index do |i, obj|
			next if i == 1 && memo == self[0]
			memo = yield(memo, obj)
		end
		return memo
	end
end

def multiply_els(array)
	array.my_inject(1) { |memo, i| memo * i }
end

=begin TESTS
array = (1..10).to_a
my_array = array
puts array.inspect

puts"each/my_each:"
proc = Proc.new { |i| print "#{i+2} " }
array.each(&proc)
puts
my_array.my_each(&proc)
puts
puts "\n"

puts "each_with_index/my_each_with_index:"
proc = Proc.new { |i, num| print "#{i}: #{i+2} "}
array.each_with_index(&proc)
puts
my_array.my_each_with_index(&proc)
puts
puts "\n"

puts "my_select: "
proc = Proc.new { |i| i % 2 == 0 }
puts array.select(&proc).inspect
puts my_array.my_select(&proc).inspect
puts

puts "my_map: "
puts array.map(&proc).inspect
puts my_array.my_map(&proc).inspect
puts

puts "my_all?:"
proc = Proc.new { |i| i > 0 }
proc2 = Proc.new { |i| i < 9 }
puts "All in array are greater than 0." if array.all?(&proc)
puts "All in my_array are greater than 0." if my_array.my_all?(&proc)
puts "All of array is less than 9." if array.all?(&proc2)
puts "All of my_array is less than 9." if my_array.my_all?(&proc2)
puts

puts "my_any?"
proc = Proc.new { |i| i == 5 }
proc2 = Proc.new { |i| i == 0 }
puts "Anything in array is equal to 5." if array.any?(&proc)
puts "Anything in my_array is equal to 5." if my_array.my_any?(&proc)
puts "Anything in array is equal to 0." if array.any?(&proc2)
puts "Anything in my_array is equal to 0." if my_array.my_any?(&proc2)
puts

puts "my_none?"
proc = Proc.new { |i| i == 0 }
proc2 = Proc.new { |i| i == 5 }
puts "Nothing in array is equal to 0." if array.none?(&proc)
puts "Nothing in my_array is equal to 0." if my_array.my_none?(&proc)
puts "Nothing in array is equal to 5." if array.none?(&proc2)
puts "Nothing in my_array is equal to 5." if my_array.my_none?(&proc2)
puts

puts "my_inject?"
proc = Proc.new { |memo, i| memo + i }
puts "The sum of array is #{array.inject(&proc)}"
puts "The sum of my_array is #{my_array.my_inject(&proc)}"
puts "The product of array is #{multiply_els(array)}"
=end