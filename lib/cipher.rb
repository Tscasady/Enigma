require './lib/key_gen'
require './lib/offset_gen'
require './lib/shift_generator'
class Cipher

  attr_reader :keys, :message, :character_set
  #this should be able to be given 2/3 of skd, and return everything
  def initialize(message, key, date, prefix)
    @message = message
    @prefix = prefix
    @operator = @prefix == 'en' ? '+' : '-'
    @character_set = ('a'..'z').to_a << ' '
    @shifts = ShiftGenerator.new(shift_order, self)
    @keys = KeyGen.new(self, key).key
    @offset = OffsetGen.new(self, date)
    @date = @offset.date
  end

  def transform_message
    @message.downcase.chars.map.with_index do |character, index|
      current = @character_set.find_index(character)
      if !@character_set.include?(character)
        character
      else
        @character_set[(current.send(@operator, @shifts.shifts[index % 4])) % 27]
      end
    end.join
  end

  def output
    { "#{@prefix}cryption": transform_message, key: @keys, date: @date }
  end

  def shift_order
    @message.length % 4
  end

  def get_offset
    @offset.date_to_offset
  end

  def ordered_offset
    @offset.date_to_offset.rotate(shift_order)
  end

  def crack_shift
    @shifts.crack_shift
  end
end
