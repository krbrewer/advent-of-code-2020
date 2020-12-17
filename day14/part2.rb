file_data = File.read("day14.txt").split("\n").map{|x| x.split(" = ")}

mask = ""
lookup_table = []
mem = []

for line in file_data
    if line[0] === "mask"
        mask = line[1]
    else
        x_count = 0
        masked_address = "%0*b" % [36, line[0][4, line[0].length - 1].to_i]
        for i in 0..35
            if mask[i] != "0"
                if mask[i] === "X"
                    x_count += 1
                end
                masked_address[i] = mask[i]
            end
        end
        for i in 0..2**x_count - 1
            k = 35
            set_float = "%0*b" % [36, i]
            address = masked_address.dup
            for j in 35.downto(0)
                if masked_address[j] === "X"
                    address[j] = set_float[k]
                    k -= 1
                end
            end
            address = address.to_i(2)
            lookup_table_index = lookup_table.index(address)
            if !lookup_table_index
                lookup_table << address
                lookup_table_index = lookup_table.length - 1
            end
            mem[lookup_table_index] = line[1].to_i
        end
    end
end

puts mem.select{|x| x != nil}.inject(0, :+)