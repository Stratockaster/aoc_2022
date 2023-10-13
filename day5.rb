# frozen_string_literal: true

module AOC
  STACK_SIZE = 9

  def self.initial_stacks
    lines = File.readlines('input/day5.1').map(&:chomp)
    lines
      .map { |el| el.chars.each_slice(4).map(&:join).map { |item| item.gsub('[', '').gsub(']', '').gsub(' ', '') } }
      .map { |row| row.fill('', row.size, STACK_SIZE - row.size) }
      .transpose
      .map { |row| row.reject(&:empty?) }
      .map(&:reverse)
      .each_with_object({}).with_index { |(el, hash), i| hash[i+1] = el }
  end

  def self.input
    File.readlines('input/day5').map(&:chomp)
  end

  def self.calculate
    convert_instruction_to_array =
      ->(instruction) { instruction.gsub('move', '').gsub('from', '').gsub('to', '').split(' ') }

    input
      .map(&convert_instruction_to_array)
      .map { |instruction| instruction.map(&:to_i) }
      .each_with_object(initial_stacks) do |instruction, stack|
        apply_instruction_to_stack(instruction, stack)
      end
      .values.map(&:last).join
  end

  def self.apply_instruction_to_stack(instruction, stack)
    items_count_to_get, from, to = instruction

    # part 1
    # items_count_to_get.times { move_item(stack, from, to) }

    # part 2
    move_items(stack, from, to, items_count_to_get)
  end

  def self.move_item(stack, from, to)
    item = stack[from].pop
    stack[to] << item
  end

  def self.move_items(stack, from, to, count)
    items = stack[from].pop(count)
    stack[to] = stack[to] + items
  end
end

pp AOC.calculate
