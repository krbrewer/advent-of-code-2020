file_data = File.read("day4.txt").split("\n\n")

valid_count = 0

for line in file_data
    line_array = line.gsub(/\s+/m, ' ').strip.split(" ")
    line_tuples = line_array.map {|item| item.split(":")}
    country_id_index = line_array.find_index {|item| item.split(":")[0] === "cid"}

    # Birth Year Validation
    byr = line_tuples.detect {|item| item[0] === "byr"}
    byr_is_valid = byr != nil && byr[1].to_i.between?(1920, 2002)

    # Issue Year Validation
    iyr = line_tuples.detect {|item| item[0] === "iyr"}
    iyr_is_valid = iyr != nil && iyr[1].to_i.between?(2010, 2020)

    # Expiration Year Validation
    eyr = line_tuples.detect {|item| item[0] === "eyr"}
    eyr_is_valid = eyr != nil && eyr[1].to_i.between?(2020, 2030)

    # Height Validation
    hgt = line_tuples.detect {|item| item[0] === "hgt"}
    hgt_is_valid = false
    if hgt != nil
        hgt_val = hgt[1].scan(/\d+|[A-Za-z]+/)[0]
        hgt_type = hgt[1].scan(/\d+|[A-Za-z]+/)[1]
        if hgt_type === "cm"
            hgt_is_valid = hgt_val.to_i.between?(150, 193)
        elsif hgt_type === "in"
            hgt_is_valid = hgt_val.to_i.between?(59, 76)
        else
            hgt_is_valid = false
        end
    end

    # Hair Color Validation
    hcl = line_tuples.detect {|item| item[0] === "hcl"}
    hcl_is_valid = hcl != nil && !!(hcl[1] =~ /#[0-9a-f]/) && hcl[1].length === 7

    # Eye Color Validation
    valid_eye_colors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    ecl = line_tuples.detect {|item| item[0] === "ecl"}
    ecl_is_valid = ecl != nil && valid_eye_colors.include?(ecl[1])

    # Passport ID Validation
    pid = line_tuples.detect {|item| item[0] === "pid"}
    pid_is_valid = pid != nil && !!(pid[1] =~ /[0-9]/) && pid[1].length === 9
    
    if byr_is_valid && iyr_is_valid && eyr_is_valid && hgt_is_valid && hcl_is_valid && ecl_is_valid && pid_is_valid
        valid_count += 1
    end
end

puts valid_count