require './lib/key_gen'
require './lib/offset_gen'
require './lib/shift_generator'
class Cipher

  attr_reader :keys
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
    result = message.downcase.chars.map.with_index do |character, index|
      current = @character_set.find_index(character)
      @character_set[(current.send(operator, shifts[index % 4])) % 27]
    end.join
    {"#{prefix}cryption": result, key: key, date: date }
  end
end
