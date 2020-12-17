file_data = File.read("day15.txt").split(",").map{|x| x.to_i}

memory_game = file_data.map(&:clone)

for i in file_data.length..2019
    last_occurrence = memory_game[0, memory_game.length - 1].rindex(memory_game[i - 1])
    if last_occurrence
        memory_game << i - 1 - last_occurrence
    else
        memory_game << 0
    end
end

puts "#{memory_game[2019]}"