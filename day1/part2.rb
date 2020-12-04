file_data = File.read("day1.txt").split

i = 0

while i < file_data.length do
    j = i
    while j < file_data.length do
        k = j
        diff = 2020 - file_data[i].to_i - file_data[j].to_i
        while k < file_data.length do
            if diff === file_data[k].to_i
                puts file_data[i].to_i * file_data[j].to_i * file_data[k].to_i
            end
            k +=1
        end
        j +=1
    end
    i +=1
end