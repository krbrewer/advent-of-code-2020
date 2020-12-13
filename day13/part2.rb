file_data = File.read("day13.txt").split("\n")

buses = file_data[1].split(",").map { |x| x === "x" ? x : x.to_i }
timestamp = buses.detect { |x| x != "x" }
found_timestamp = false

while !found_timestamp
    found_timestamp = true
    for i in 0..buses.length - 1
        if buses[i] != "x"
            if (timestamp + i) % buses[i] != 0
                found_timestamp = false
                lcm_increase = buses[0, i].select { |x| x != "x" }.inject(:*)
                timestamp += lcm_increase
                break
            end
        end
    end
end

puts "#{timestamp}"