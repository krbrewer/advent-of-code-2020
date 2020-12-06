file_data = File.read("day5.txt").split

id_totals = 0
for i in 96..911
    id_totals += i
end

for line in file_data
    row = 0
    col = 0
    row_incrementer = 64
    col_incrementer = 4

    for x in line.split("")
        if x === "B"
            row += row_incrementer
            row_incrementer /= 2
        elsif x === "F"
            row_incrementer /= 2
        elsif x === "R"
            col += col_incrementer
            col_incrementer /= 2
        elsif x === "L"
            col_incrementer /= 2
        end
    end

    id_totals -= row * 8 + col
end

puts id_totals