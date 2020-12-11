file_data = File.read("day9.txt").split("\n")

n = 25

x = nil

for i in 0..file_data.length - n - 1
    options = []
    for j in i..i + n - 2
        for k in i + 1..i + n - 1
            options.push(file_data[j].to_i + file_data[k].to_i)
        end
    end

    if !options.include?(file_data[i + n].to_i)
        x = file_data[i + n]
        break
    end
end

puts x