file_data = File.read("day18.txt").split("\n").map{|x| x.gsub!(/\s/,'').split("")}

for i in 0..file_data.length - 1
    idx = 0
    while file_data[i].length > 1
        if file_data[i][idx, 3].select{|x| x === "(" || x === ")"}.length > 0
            # Encountered Parens
            if file_data[i][idx] === "(" && file_data[i][idx + 2] === ")"
                file_data[i].slice!(idx)
                file_data[i].slice!(idx + 1)
                idx = 0
            elsif file_data[i][idx] === ")"
                idx += 2
            else
                idx += 1
            end
        else
            if file_data[i][idx + 1] === "+"
                # Add
                file_data[i][idx] = (file_data[i][idx].to_i + file_data[i][idx + 2].to_i).to_s
            else
                # Multiply
                file_data[i][idx] = (file_data[i][idx].to_i * file_data[i][idx + 2].to_i).to_s
            end
            file_data[i].slice!(idx + 1)
            file_data[i].slice!(idx + 1)
            idx = 0
        end

        if idx >= file_data[i].length - 1
            idx = 0
        end
    end
end

puts "#{file_data.flatten.map(&:to_i).inject(&:+)}"