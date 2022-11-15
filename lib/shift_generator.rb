# frozen_string_literal: true

# This class generates shifts for transforming messages.
require './lib/key_gen'
require './lib/offset_gen'
#if no key, give shift orderer
#if no key and prefix == 'en' generate random key
class ShiftGenerator 
  attr_reader :key, :offset, :shift_order

  def initialize(shift_order, cipher)
    @target_indicies = [27, 4, 13, 3]
    @shift_order = shift_order
    @cipher = cipher
  end

  def shifts
    offsets.zip(key_to_shift_part).map(&:sum)
    #{ |shift| shift.reduce(operator.to_sym) }
  end

  def key_to_shift_part
    shifts = []
    count = 0
    4.times do
      shifts << keys[count..count + 1].to_i
      count += 1
    end
    shifts
  end

  def crack_shift
    @target_indicies.rotate(@shift_order)
  end

  def offsets
    @cipher.get_offset
  end

  def keys
    @cipher.keys
  end

  # def get_shift(key)
  #   if @prefix == 'en' && key.nil?
  #     @key = generate_key
  #   elsif key.nil?
  #     @key = @target_indicies.order
  #   else
  #     key
  #   end
  # end
end
