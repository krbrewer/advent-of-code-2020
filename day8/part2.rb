file_data = File.read("day8.txt").split("\n")

accumulator = 0
visited_instructions = []
curr = 0
changed_instruction = 0
terminated = false

while terminated != true
    # Reset everything.
    accumulator = 0
    visited_instructions = []
    curr = 0
    altered_file_data = file_data.map(&:clone)

    # Check for the next jmp or nop to change.
    while true
        check_instruction = file_data[changed_instruction].split(" ")[0]
        if check_instruction === "jmp"
            altered_file_data[changed_instruction]["jmp"] = "nop"
            break
        elsif check_instruction === "nop"
            altered_file_data[changed_instruction]["nop"] = "jmp"
            break
        end
        changed_instruction += 1
    end

    terminated = true
    while curr < file_data.length
        instruction = altered_file_data[curr].split(" ")

        # Exit if line already visited.
        if visited_instructions.include?(curr)
            terminated = false
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
    changed_instruction += 1
end

puts accumulator
