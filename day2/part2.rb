file_data = File.read("day2.txt").split("\n")

valid_passwords = 0

for i in 0..file_data.length - 1
    password_check = file_data[i].split
    range = password_check[0].split("-")
    first = range[0].to_i
    second = range[1].to_i
    check = password_check[1].split(":")[0]
    password = password_check[2]

    password_has_first_char = password[first - 1] === check
    password_has_second_char = password[second - 1] === check
    
    if password_has_first_char ^ password_has_second_char
        valid_passwords += 1
    end
end

puts valid_passwords