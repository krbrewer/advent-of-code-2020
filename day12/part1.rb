file_data = File.read("day12.txt").split("\n")

cardinal = [0, 0, 0, 0] # [N, E, S, W]

direction = 1 # E

for command in file_data
    action = command[0]
    command[0] = ""
    value = command.to_i
    
    if action === "E"
        cardinal[1] += value
    elsif action === "W"
        cardinal[3] += value
    elsif action === "N"
        cardinal[0] += value
    elsif action === "S"
        cardinal[2] += value
    elsif action === "F"
        cardinal[direction] += value
    elsif action === "R"
        direction = (direction + (value / 90)) % 4
    elsif action === "L"
        direction = ((direction - (value / 90)) + 4) % 4
    end
end

puts (cardinal[0] - cardinal[2]).abs + (cardinal[1] - cardinal[3]).abs