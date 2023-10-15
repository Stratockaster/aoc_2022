# frozen_string_literal: true

module AOC
  MARKER_SYM_COUNT = 4
  MESSAGE_SYM_COUNT = 14

  def self.input
    File.readlines('input/day6')[0].chomp.split('')
  end

  def self.calculate
    offset = 0
    input.size.times do
      slice = input.slice(offset, MESSAGE_SYM_COUNT)
      return offset + MESSAGE_SYM_COUNT if slice.uniq.size == MESSAGE_SYM_COUNT

      offset += 1
    end

    raise 'No marker found'
  end
end

print AOC.calculate
