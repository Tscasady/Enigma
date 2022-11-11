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
end
