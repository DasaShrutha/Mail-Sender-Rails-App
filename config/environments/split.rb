arr = [1,2,44,55,56,67,68,69]

def find_consecutives(arr)
	consecutives = []
	
	arr.each_with_index do |i, index|
		unless index + 1 == arr.length
			if (i - arr[index + 1]).abs == 1
				consecutives <<  [i, arr[index + 1]]
			end
		end
	end

	print consecutives
end

find_consecutives(arr)
