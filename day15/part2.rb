file_data = File.read("day15.txt").split(",").map{|x| x.to_i}

memory_game = Hash.new{|f,x| f[x] = []}
file_data.each.with_index{|x, i| memory_game[x].prepend(i)}
count = 29999999

last_number = file_data.last

for i in file_data.length..count
    if i % 1000000 === 0
        puts i
        puts "#{((i* 100)/count)}%"
    end
    # Repeated number.
    if memory_game[last_number].count > 1
        last_number = memory_game[last_number][0] - memory_game[last_number][1]
    else
        last_number = 0
    end

    memory_game[last_number].prepend(i)
end

puts "#{last_number}"