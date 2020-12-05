file_data = File.read("day4.txt").split("\n\n")

valid_count = 0

for line in file_data
    line_array = line.gsub(/\s+/m, ' ').strip.split(" ")
    country_id_index = line_array.find_index {|item| item.split(":")[0] === "cid"}
    if line_array.length === 8 or (line_array.length === 7 and country_id_index === nil)
        valid_count += 1
    end
end

puts valid_count