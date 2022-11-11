# frozen_string_literal: true
# This class generates shifts for encrypting.
class ShiftGenerator
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end
end
