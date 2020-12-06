file_data = File.read("day6.txt").split("\n\n")

yes_count = 0

for line in file_data
    person = line.split("\n")
    intersect_answers = person[0].split("")
    for p in person
        intersect_answers = intersect_answers&p.split("")
    end
    yes_count += intersect_answers.length
end

puts yes_count