def getfile
  file = gets.chomp
end

def process(file)
  File.open(file, "r") do |fileprocess|
    fileprocess.each_line {|line| puts line.dump}
  end
end

process(getfile)
