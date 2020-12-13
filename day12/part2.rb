file_data = File.read("day12.txt").split("\n")

cardinal = [0, 0] # [N/S, E/W] +/-

waypoint = [1, 10] # [N/S, E/W] +/-

direction = 1 # E

for command in file_data
    action = command[0]
    command[0] = ""
    value = command.to_i
    
    if action === "E"
        waypoint[1] += value
    elsif action === "W"
        waypoint[1] -= value
    elsif action === "N"
        waypoint[0] += value
    elsif action === "S"
        waypoint[0] -= value
    elsif action === "F"
        cardinal[0] += (value * waypoint[0])
        cardinal[1] += (value * waypoint[1])
    elsif action === "R"
        for i in 1..(value / 90)
            temp_waypoint = waypoint.map(&:clone)
            waypoint[0] = -temp_waypoint[1]
            waypoint[1] = temp_waypoint[0]
        end
    elsif action === "L"
        for i in 1..(value / 90)
            temp_waypoint = waypoint.map(&:clone)
            waypoint[0] = temp_waypoint[1]
            waypoint[1] = -temp_waypoint[0]
        end
    end
end

puts cardinal[0].abs + cardinal[1].abs