file_data = File.read("day10.txt").split("\n")

file_data = file_data.map{|x| x.to_i}.sort!

counts = [0, 0, 1]

curr = 0

for i in 0..file_data.length - 1
    counts[file_data[i] - curr - 1] += 1
    curr = file_data[i]
end

puts "#{counts[0]*counts[2]}"