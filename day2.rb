# frozen_string_literal: true

module AOC
  # A - rock
  # B - paper
  # C - scissors

  # part 1
  # X - rock
  # Y - paper
  # Z - sciccors

  # part 2
  # X - need to lose
  # Y - need draw
  # Z - need to win
  def self.input
    File.readlines('input/day2').map(&:chomp).map { |el| el.split(' ') }
  end

  def self.total
    input.map do |round_plan|
      round_result(round_plan[0], round_plan[1])
    end.sum
  end

  def self.round_result(enemy, me)
    map = {
      'A' => 1,
      'B' => 2,
      'C' => 3,
      'X' => 1,
      'Y' => 2,
      'Z' => 3,
      'DRAW' => 3,
      'WIN' => 6,
      'LOST' => 0
    }

    # part 1
    # result = winner(enemy, me)
    # case result
    # when 'DRAW'
    #   map['DRAW'] + map[me]
    # when 'WIN'
    #   map['WIN'] + map[me]
    # when 'LOST'
    #   map['LOST'] + map[me]
    # end

    # part 2
    case me
    when 'X'
      map['LOST'] + map[weaker_than(enemy)]
    when 'Z'
      map['WIN'] + map[stronger_than(enemy)]
    when 'Y'
      map['DRAW'] + map[same_as(enemy)]
    end
  end

  def self.winner(enemy, me)
    lost = %w[AZ BX CY]
    win = %w[AY BZ CX]

    combination = enemy + me
    if win.include? combination
      'WIN'
    elsif lost.include? combination
      'LOST'
    else
      'DRAW'
    end
  end

  def self.weaker_than(jest)
    { 'A' => 'C', 'B' => 'A', 'C' => 'B' }[jest]
  end

  def self.stronger_than(jest)
    { 'A' => 'B', 'B' => 'C', 'C' => 'A' }[jest]
  end

  def self.same_as(jest)
    jest
  end
end

pp AOC.total
