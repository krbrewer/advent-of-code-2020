file_data = File.read("day16.txt").split("\n\n")

field_names = file_data[0].split("\n").map{|x| x.split(": ")[0]}
field_name_order = []
fields = file_data[0].split("\n").map{|x| x.split(": ")[1]}

valid_numbers = []
valid_numbers_by_field = fields.map{|x| []}

field_number = field_names.map{|x| []}

# Determine valid ranges for each field.
for i in 0..fields.length - 1
    ranges = fields[i].split(" or ")
    for j in ranges[0].split("-")[0].to_i..ranges[0].split("-")[1].to_i
        valid_numbers[j] = 1
        valid_numbers_by_field[i][j] = 1
    end
    for j in ranges[1].split("-")[0].to_i..ranges[1].split("-")[1].to_i
        valid_numbers[j] = 1
        valid_numbers_by_field[i][j] = 1
    end
end

nearby_tickets = file_data[2].split("\n")
nearby_tickets = nearby_tickets[1, nearby_tickets.length]

valid_nearby_ticket = []

# Determine valid tickets.
for i in 0..nearby_tickets.length - 1
    ticket = nearby_tickets[i].split(",").map{|x| x.to_i}
    is_valid = true
    for j in 0..ticket.length - 1
        if valid_numbers[ticket[j]] != 1
            is_valid = false
        end
    end
    if is_valid
        valid_nearby_ticket << nearby_tickets[i]
    end
end

for i in 0..valid_numbers_by_field.length - 1
    for j in 0..valid_nearby_ticket[0].split(",").length - 1
        all_valid = true
        for k in 0..valid_nearby_ticket.length - 1
            ticket = valid_nearby_ticket[k].split(",").map{|x| x.to_i}
            if valid_numbers_by_field[i][ticket[j]] != 1
                all_valid = false
            end
        end
        if all_valid
            field_number[i] << j
        end
    end
end

still_nested = true
claimed_fields = []

# Determine which validation matches numberically.
while claimed_fields.length < field_number.length
    for i in 0..field_number.length - 1
        if field_number[i].length - claimed_fields.length === 1
            claim = field_number[i].detect{|x| !claimed_fields.include?(x)}
            claimed_fields << claim
            field_number[i] = [claim]
        end
    end
end

my_ticket = file_data[1].split("\n")[1].split(",").map{|x| x.to_i}
result = 1

puts "#{my_ticket}"
puts "#{field_number}"
puts "#{my_ticket[field_number[0][0]] * my_ticket[field_number[1][0]] * my_ticket[field_number[2][0]] * my_ticket[field_number[3][0]] * my_ticket[field_number[4][0]] * my_ticket[field_number[5][0]]}"