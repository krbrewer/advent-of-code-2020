file_data = File.read("day2.txt").split("\n")

valid_passwords = 0

for i in 0..file_data.length - 1
    password_check = file_data[i].split
    range = password_check[0].split("-")
    min = range[0].to_i
    max = range[1].to_i
    check = password_check[1].split(":")[0]
    password = password_check[2]
    
    count = password.chars.select { |x| x === check}.length
    if count >= min and count <= max
        valid_passwords += 1
    end
end

puts valid_passwords