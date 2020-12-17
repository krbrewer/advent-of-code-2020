file_data = File.read("day16.txt").split("\n\n")

fields = file_data[0].split("\n").map{|x| x.split(": ")[1]}

valid_numbers = []

invalid_sum = 0

for i in 0..fields.length - 1
    ranges = fields[i].split(" or ")
    for j in ranges[0].split("-")[0].to_i..ranges[0].split("-")[1].to_i
        valid_numbers[j] = 1
    end
    for j in ranges[1].split("-")[0].to_i..ranges[1].split("-")[1].to_i
        valid_numbers[j] = 1
    end
end

nearby_tickets = file_data[2].split("\n")
nearby_tickets = nearby_tickets[1, nearby_tickets.length]

for i in 0..nearby_tickets.length - 1
    ticket = nearby_tickets[i].split(",").map{|x| x.to_i}
    for j in 0..ticket.length - 1
        if valid_numbers[ticket[j]] != 1
            invalid_sum += ticket[j]
        end
    end
end

puts "#{invalid_sum}"