# frozen_string_literal: true

# This class generates shifts for transforming messages.
require './lib/key_gen'
require './lib/offset_gen'
#if no key, give shift orderer
#if no key and prefix == 'en' generate random key
class ShiftGenerator 
  attr_reader :key, :offset, :shift_order

  def initialize(key, date, shift_order)
    @key = KeyGen.new(key).key
    @offset = OffsetGen.new(date)
    @target_indicies = [27, 4, 13, 3]
    @shift_order = shift_order
  end

  def key_to_shifts
    shifts = []
    count = 0
    4.times do
      shifts << @key[count..count + 1].to_i
      count += 1
    end
    shifts
  end

  def date_to_offset
    last_4_digits = (@date.to_i**2).to_s.slice(-4..-1)
    last_4_digits.chars.map(&:to_i)
  end

  def shifts
    date_to_offset.zip(key_to_shifts).map(&:sum)
  end
end
