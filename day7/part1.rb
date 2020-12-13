require 'set'
file_data = File.read("day7.txt").split("\n")

bags = []

class Bag
    def initialize(name, sub)
        @name = name
        @sub = sub
    end

    def add_sub(bag)
        @sub.push(bag)
    end

    def name
        @name
    end

    def sub
        @sub
    end
end

for i in 0..file_data.length - 1
    bag_container = file_data[i].split(" bags ")[0]
    sub_bags = file_data[i].split(" contain ")[1].split(", ")
    if sub_bags.length === 1 && sub_bags[0] === "no other bags."
        sub_bags = []
    else
        sub_bags = sub_bags.map{ |x| x[2, x.length].split(" bags")[0].split(" bag")[0] }
    end

    for bag in sub_bags
        existing_bag = bags.detect { |x| x.name === bag }
        if !!existing_bag
            existing_bag.add_sub(bag_container)
        elsif 
            newBag = Bag.new(bag, [bag_container])
            bags.push(newBag)
        end
    end
end

def bags_in_bags(bag, bags, count)
    c = count
    for b_name in bag.sub
        # If there is more to the chain.
        b = bags.detect { |x| x.name === b_name }
        if !!b
            c = bags_in_bags(b, bags, c)
        # If this sub is a leaf.
        else
            c << b_name
        end
    end

    return bag.name === "shiny gold" ? c : c << bag.name
end

count = bags_in_bags(bags.detect { |x| x.name === "shiny gold" }, bags, Set.new)

puts count.length