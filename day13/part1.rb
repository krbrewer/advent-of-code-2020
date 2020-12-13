file_data = File.read("day13.txt").split("\n")

timestamp = file_data[0].to_i
buses = file_data[1].split(",").select { |x| x != "x" }.map { |x| x.to_i }

min_wait_time_index = 0

for i in 0..buses.length - 1
    if buses[i] - (timestamp % buses[i]) < buses[min_wait_time_index] - (timestamp % buses[min_wait_time_index])
        min_wait_time_index = i
    end
end

puts (buses[min_wait_time_index] - (timestamp % buses[min_wait_time_index])) * buses[min_wait_time_index]