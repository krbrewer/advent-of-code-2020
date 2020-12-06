file_data = File.read("day6.txt").split("\n\n")

yes_count = 0

for line in file_data
    line_array = line.gsub(/\s+/m, '').strip.split("")
    yes_count += (line_array|[]).length
end

puts yes_count