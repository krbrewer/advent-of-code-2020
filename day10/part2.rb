file_data = File.read("day10.txt").split("\n")

file_data = file_data.map{|x| x.to_i}.sort!

file_data.prepend(0)
file_data.append(file_data[file_data.length - 1] + 3)

dp = [1]

for i in 1..file_data.length - 1
    ans = 0
    for j in 0..i - 1
        if file_data[j] + 3 >= file_data[i]
            ans += dp[j]
        end
    end
    dp.append(ans)
end

puts "distinct: #{dp[dp.length - 1]}"