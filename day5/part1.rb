file_data = File.read("day5.txt").split

highest_seat_id = 0

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

    seat_id = row * 8 + col

    if highest_seat_id < seat_id
        highest_seat_id = seat_id
    end
end

puts highest_seat_id