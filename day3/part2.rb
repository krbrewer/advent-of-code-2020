file_data = File.read("day3.txt").split
trees = [0, 0, 0, 0, 0]

file_data.each_with_index do |line, i|
    x = [i % line.length, (i * 3) % line.length, (i * 5) % line.length, (i * 7) % line.length, i % 2 === 0 ? -1 : i % line.length]
    x.each_with_index do |slope, j|
        if slope >= 0 and line[slope] === "#"
            trees[j] += 1
        end
    end
end

puts trees.inject(:*)