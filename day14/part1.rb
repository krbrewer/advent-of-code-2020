file_data = File.read("day14.txt").split("\n").map{|x| x.split(" = ")}

mask = ""
mem = []

for line in file_data
    if line[0] === "mask"
        mask = line[1]
    else
        next_value = "%0*b" % [36, line[1].to_i]
        for i in 35.downto(0)
            if mask[i] != "X"
                next_value[i] = mask[i]
            end
        end
        mem[line[0][4, line[0].length - 1].to_i] = next_value.to_i(2)
    end
end

puts mem.select{|x| x != nil}.inject(0, :+)