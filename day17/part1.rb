file_data = File.read("test.txt").split("\n").map{|x| x.split("")}

width = 7 * 2 + file_data.length

cube = []

for i in 0..7*2
    cube[i] = []
    for j in 0..width - 1
        cube[i][j] = []
        for k in 0..width - 1
            if i === 7 && j > 6 && j <= 6 + file_data.length && k > 6 && k <= 6 + file_data.length
                cube[i][j][k] = file_data[j - 7][k - 7]
            else
                cube[i][j][k] = "."
            end
        end
    end
end

for i in 0..5
    temp_cube = Marshal.load(Marshal.dump(cube))
    for j in 1..7*2 - 1
        for k in 1..width - 2
            for l in 1..width - 2
                actives = [
                    temp_cube[j - 1][k - 1][l - 1], temp_cube[j - 1][k - 1][l], temp_cube[j - 1][k - 1][l + 1], temp_cube[j - 1][k][l - 1], temp_cube[j - 1][k][l], temp_cube[j - 1][k][l + 1], temp_cube[j - 1][k + 1][l - 1], temp_cube[j - 1][k + 1][l], temp_cube[j - 1][k + 1][l + 1],
                    temp_cube[j][k - 1][l - 1], temp_cube[j][k - 1][l], temp_cube[j][k - 1][l + 1], temp_cube[j][k][l - 1], temp_cube[j][k][l + 1], temp_cube[j][k + 1][l - 1], temp_cube[j][k + 1][l], temp_cube[j][k + 1][l + 1],
                    temp_cube[j + 1][k - 1][l - 1], temp_cube[j + 1][k - 1][l], temp_cube[j + 1][k - 1][l + 1], temp_cube[j + 1][k][l - 1], temp_cube[j + 1][k][l], temp_cube[j + 1][k][l + 1], temp_cube[j + 1][k + 1][l - 1], temp_cube[j + 1][k + 1][l], temp_cube[j + 1][k + 1][l + 1]
                ]
                active_count = actives.filter{|x| x === "#"}.length
                # Active
                if temp_cube[j][k][l] === "#"
                    if active_count === 2 || active_count === 3
                        cube[j][k][l] = "#"
                    else
                        cube[j][k][l] = "."
                    end
                # Inactive
                else
                    if active_count === 3
                        cube[j][k][l] = "#"
                    else
                        cube[j][k][l] = "."
                    end
                end
            end
        end
    end
    # puts "next round"
end

active_count = 0

for i in 0..cube.length - 1
    # puts "cube level #{i}"
    for j in 0..cube[0].length - 1
        for k in 0..cube[0][0].length - 1
            if cube[i][j][k] === "#"
                active_count += 1
            end
        end
        # puts "#{cube[i][j]}"
    end
end


puts "#{active_count}"