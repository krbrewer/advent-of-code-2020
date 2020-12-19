class Integer
    def **(other)
      self + other
    end
end
  
puts eval(File.read('day18.txt').chomp.gsub(/\+/, '**').gsub("\n", '+'))