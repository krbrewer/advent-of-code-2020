file_data = File.read("day8.txt").split("\n")

accumulator = 0
visited_instructions = []
curr = 0

while curr < file_data.length
    instruction = file_data[curr].split(" ")

    # Exit if line already visited.
    if visited_instructions.include?(curr)
        break
    end

    # Mark current place as visited.
    visited_instructions.push(curr)

    # Accumulator
    if instruction[0] === "acc"
        accumulator += instruction[1].to_i
        curr += 1
    # Jump
    elsif instruction[0] === "jmp"
        curr += instruction[1].to_i
    # No Op
    else
        curr += 1
    end
end

puts accumulator
