file_data = File.read("day3.txt").split
trees = 0

file_data.each_with_index do |line, i|
    x = (i * 3) % line.length
    if line[x] === "#"
        trees += 1
    end
end

puts trees