# frozen_string_literal: true

# This class encrypts messages
class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key, date = Time.now)
    shifts = ShiftGenerator.new(key, date).shifts
    { encryption: encrypt_message(message, shifts), key: key, date: date }
  end

  def decrypt(message, key, date = Time.now)
    shifts = ShiftGenerator.new(key, date).shifts
    { decryption: decrypt_message(message, shifts), key: key, date: date }
  end

  def encrypt_message(message, shifts)
    shift_count = 0
    message.chars.map do |character|
      current_character = @character_set.find_index(character)
      new_character = (current_character + shifts[shift_count % 4]) % 27
      shift_count += 1
      @character_set[new_character]
    end.join
  end

  def decrypt_message(message, shifts)
    shift_count = 0
    message.chars.map do |character|
      current_character = @character_set.find_index(character)
      new_character = (current_character - shifts[shift_count % 4]) % 27
      shift_count += 1
      @character_set[new_character]
    end.join
  end
end
