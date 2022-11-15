
require 'time'
# Generates a date offset
class OffsetGen
  attr_reader :date

  def initialize(cipher, date = nil)
    @date = date_to_string(date)
    @cipher = cipher
  end

  def date_to_offset
    (@date.to_i**2).to_s.slice(-4..-1).chars.map(&:to_i)
  end

  def date_to_string(date)
    date ||= Time.now
    return date if date.is_a? String

    date.strftime('%d%m%y')
  end
end
