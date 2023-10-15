result = []
acc = []

File.readlines('input/day1').map(&:chomp).each do |el|
  if !el.empty?
    acc << el
  else
    result << acc
    acc = []
  end
end

# part 1
pp result.map { |el| el.map(&:to_i) }.map(&:sum).max

# part 2
pp result.map { |el| el.map(&:to_i) }.map(&:sum).sort.reverse.take(3).sum
