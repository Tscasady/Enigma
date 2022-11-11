# frozen_string_literal: true

# This class generates shifts for encrypting.
class ShiftGenerator
  attr_reader :key, :date

  def initialize(key = generate_key, date)
    @key = key
    @date = date
  end

  def generate_key
    5.times.map { rand(10) }.join
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
    last_4_digits.chars.map{ |offset| offset.to_i }
  end

  def shifts
    date_to_offset.zip(key_to_shifts).map(&:sum)
  end
end
