# frozen_string_literal: true

class String
  def upper?
    self == upcase
  end

  def lower?
    self == downcase
  end
end

module AOC
  def self.input
    File.readlines('input/day3').map(&:chomp)
  end

  def self.calculate
    input.map do |items|
      splitted_items = items.split('').each_slice(items.size / 2).to_a
      items_intersection = splitted_items[0] & splitted_items[1]
      priority(items_intersection[0])
    end.sum
  end

  def self.priority(item)
    if item.lower?
      item.bytes[0] - 96
    else
      item.bytes[0] - 38
    end
  end

  def self.calculate2
    input
      .each_slice(3)
      .map { |group| common_item(group) }
      .map { |item| priority(item) }
      .sum
  end

  def self.common_item(group)
    (group[0].codepoints & group[1].codepoints & group[2].codepoints).first.chr
  end
end

print AOC.calculate
print "\n"
print AOC.calculate2
