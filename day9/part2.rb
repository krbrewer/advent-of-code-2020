file_data = File.read("day9.txt").split("\n")

x = 1124361034

result = 0

for i in 0..file_data.length - 1
    total = 0
    j = i
    contiguous = []
    while total < x
        contiguous.push(file_data[j].to_i)
        total += file_data[j].to_i
        j += 1
    end

    if total === x
        result = contiguous.max + contiguous.min
        break
    end
end

puts result