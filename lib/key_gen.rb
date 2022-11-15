class KeyGen
  attr_reader :key

  def initialize(cipher, key = nil)
    @key = key ||= generate_key
    @target_indicies = [27, 4, 13, 3]
    @cipher = cipher
  end

  def generate_key
    rand.to_s[2..6]
  end

  def fetch_ordered_offset
    @cipher.ordered_offset
  end

  def crack_key_gen
    find_shift_difference.zip(fetch_ordered_offset).map { |element| (element[0] - element[1]) % 27}
  end

  def fetch_crack_shift
    @cipher.crack_shift
  end

  def find_shift_difference
    @cipher.message[-4..].chars.map.with_index do |character, index|
      @cipher.character_set.find_index(character) - fetch_crack_shift[index]
    end
  end

  #   def get_shift(key)
  #   if @prefix == 'en' && key.nil?
  #     @key = generate_key
  #   elsif key.nil?
  #     @key = @target_indicies.order
  #   else
  #     key
  #   end
  # end
end
