file_data = File.read("day1.txt").split

i = 0

while i < file_data.length do
    j = i
    diff = 2020 - file_data[i].to_i
    while j < file_data.length do
        if diff === file_data[j].to_i
            puts file_data[i].to_i * file_data[j].to_i
        end
        j +=1
    end
    i +=1
end