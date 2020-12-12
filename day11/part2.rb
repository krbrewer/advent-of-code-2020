file_data = File.read("day11.txt").split("\n")

# file_data.map(&:clone)
diff = 1
occupied = 0
previous_file_data = file_data.map(&:clone)

while diff > 0
    diff = 0
    updated_file_data = previous_file_data.map(&:clone)
    for i in 0..previous_file_data.length - 1
        for j in 0..previous_file_data[0].length - 1
            ring = 1
            # Seats
            if i > 0
                if j > 0
                    top_left = previous_file_data[i - 1][j - 1]
                    ring = 1
                    while top_left === '.' && i - 1 - ring >= 0 && j - 1 - ring >= 0
                        top_left = previous_file_data[i - 1 - ring][j - 1 - ring]
                        ring += 1
                    end
                end
                top_center = previous_file_data[i - 1][j]
                ring = 1
                while top_center === '.' && i - 1 - ring >= 0
                    top_center = previous_file_data[i - 1 - ring][j]
                    ring += 1
                end
                if j < previous_file_data[0].length - 1
                    top_right = previous_file_data[i - 1][j + 1]
                    ring = 1
                    while top_right === '.' && i - 1 - ring >= 0 && j + 1 + ring <= previous_file_data[0].length - 1
                        top_right = previous_file_data[i - 1 - ring][j + 1 + ring]
                        ring += 1
                    end
                end
            end
            
            if j > 0
                center_left = previous_file_data[i][j - 1]
                ring = 1
                while center_left === '.' && j - 1 - ring >= 0
                    center_left = previous_file_data[i][j - 1 - ring]
                    ring += 1
                end
            end
            if j < previous_file_data[0].length - 1
                center_right = previous_file_data[i][j + 1]
                ring = 1
                while center_right === '.' && j + 1 + ring <= previous_file_data[0].length - 1
                    center_right = previous_file_data[i][j + 1 + ring]
                    ring += 1
                end
            end

            if i < previous_file_data.length - 1
                if j > 0
                    bottom_left = previous_file_data[i + 1][j - 1]
                    ring = 1
                    while bottom_left === '.' && i + 1 + ring <= previous_file_data.length - 1 && j - 1 - ring >= 0
                        bottom_left = previous_file_data[i + 1 + ring][j - 1 - ring]
                        ring += 1
                    end
                end
                bottom_center = previous_file_data[i + 1][j]
                ring = 1
                while bottom_center === '.' && i + 1 + ring <= previous_file_data.length - 1
                    bottom_center = previous_file_data[i + 1 + ring][j]
                    ring += 1
                end
                if j < previous_file_data[0].length - 1
                    bottom_right = previous_file_data[i + 1][j + 1]
                    ring = 1
                    while bottom_right === '.' && i + 1 + ring <= previous_file_data.length - 1 && j + 1 + ring <= previous_file_data[0].length - 1
                        bottom_right = previous_file_data[i + 1 + ring][j + 1 + ring]
                        ring += 1
                    end
                end
            end

            adjacent_seats = []
            # Top Row
            if i === 0
                # Left Column
                if j === 0
                    adjacent_seats = [center_right, bottom_center, bottom_right]
                # Right Column
                elsif j === previous_file_data[0].length - 1
                    adjacent_seats = [center_left, bottom_left, bottom_center]
                # Rest
                else
                    adjacent_seats = [center_left, center_right, bottom_left, bottom_center, bottom_right]
                end
            # Bottom Row
            elsif i === previous_file_data.length - 1
                # Left Column
                if j === 0
                    adjacent_seats = [top_center, top_right, center_right]
                # Right Column
                elsif j === previous_file_data[0].length - 1
                    adjacent_seats = [top_left, top_center, center_left]
                # Rest
                else
                    adjacent_seats = [top_left, top_center, top_right, center_left, center_right]
                end
            # Rest
            else
                # Left Column
                if j === 0
                    adjacent_seats = [top_center, top_right, center_right, bottom_center, bottom_right]
                # Right Column
                elsif j === previous_file_data[0].length - 1
                    adjacent_seats = [top_left, top_center, center_left, bottom_left, bottom_center]
                # Rest
                else
                    adjacent_seats = [top_left, top_center, top_right, center_left, center_right, bottom_left, bottom_center, bottom_right]
                end
            end

            if previous_file_data[i][j] === "L" && !adjacent_seats.include?("#")
                diff += 1
                occupied += 1
                updated_file_data[i][j] = "#"
            elsif previous_file_data[i][j] === "#" && adjacent_seats.select{|x| x === "#"}.length >= 5
                diff += 1
                occupied -= 1
                updated_file_data[i][j] = "L"
            end
        end
    end
    previous_file_data = updated_file_data.map(&:clone)
end

puts occupied