class KeyGen
  attr_reader :key

  def initialize(cipher, key = nil)
    @key = key ||= generate_key
    @cipher = cipher
  end

  def generate_key
    rand.to_s[2..6]
  end

  def fetch_date
    @cipher.date
  end

  def find_key(message, shift, date)
    d = date_to_offset(date).order
    shift_order = @target_indicies.order
    shift = []
    message[-4..].chars.map.with_index do |character, index|
      shift << @character_set.find_index(character) - shift_order[index]
    end
    shift.zip(d).map { |element| (element[0] - element[1]) % 27 } 
  end
end
