file_data = File.read("day7.txt").split("\n")

bags = []

class Bag
    def initialize(name, sub, sub_count)
        @name = name
        @sub = sub
        @sub_count = sub_count
    end

    def name
        @name
    end

    def sub
        @sub
    end

    def sub_count
        @sub_count
    end
end

for i in 0..file_data.length - 1
    bag_container = file_data[i].split(" bags ")[0]
    sub_bags = file_data[i].split(" contain ")[1].split(", ")
    sub = []
    sub_count = []
    if sub_bags.length === 1 && sub_bags[0] === "no other bags."
        sub_bags = []
    else
        sub = sub_bags.map { |x| x[2, x.length].split(" bags")[0].split(" bag")[0] }
        sub_count = sub_bags.map { |x| x[0].to_i }
        newBag = Bag.new(bag_container, sub, sub_count)
        bags.push(newBag)
    end
end

def bags_in_bags(bag, bags)
    c = 0
    for i in 0..bag.sub.length - 1
        # If there is more to the chain.
        b = bags.detect { |x| x.name === bag.sub[i] }
        if !!b
            c += bags_in_bags(b, bags) * bag.sub_count[i]
        # If this sub is a leaf.
        else
            c += bag.sub_count[i]
        end
    end

    return bag.name === "shiny gold" ? c : c + 1
end

count = bags_in_bags(bags.detect { |x| x.name === "shiny gold" }, bags)

puts count