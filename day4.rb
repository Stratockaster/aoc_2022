# frozen_string_literal: true

require 'set'

full_overlaps_count = File.readlines('input/day4')
                          .map(&:chomp)
                          .map { |range| range.split(',') }
                          .map { |arr_range| arr_range.map { |a_r| a_r.split('-') }.map { |a_r| (a_r[0]..a_r[1]).to_set } }
                          .count do |pair|
                            intersection = pair[0] & pair[1]
                            intersection == pair[0] || intersection == pair[1]
                          end

pp full_overlaps_count

overlaps_count = File.readlines('input/day4')
                     .map(&:chomp)
                     .map { |range| range.split(',') }
                     .map { |arr_range| arr_range.map { |a_r| a_r.split('-') }.map { |a_r| (a_r[0]..a_r[1]).to_set } }
                     .count { |pair| !(pair[0] & pair[1]).empty? }

pp overlaps_count
