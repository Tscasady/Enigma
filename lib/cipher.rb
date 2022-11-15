require './lib/defaults'

class Cipher
  include Defaults
  attr_reader 

  def initialize(message, key, date, prefix)
    @message = message
    @prefix = prefix
    @operator = @prefix == 'en' ? '+' : '-'
    @character_set = ('a'..'z').to_a << ' '
    @shifts = ShiftGenerator.new(key, date).shifts
  end

  def transform_message
    result = message.downcase.chars.map.with_index do |character, index|
      current = @character_set.find_index(character)
      @character_set[(current.send(operator, shifts[index % 4])) % 27]
    end.join
    {"#{prefix}cryption": result, key: key, date: date }
  end
end
