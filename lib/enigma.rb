# frozen_string_literal: true

require 'time'
require './lib/shift_generator'
# This class encrypts messages
class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ('a'..'z').to_a << ' '
  end

  def generate_key
    5.times.map { rand(10) }.join
  end

  def date_to_string(date)
    return date if date.is_a? String

    date.strftime('%d%m%y')
  end

  def encrypt(message, key = generate_key, date = Time.now)
    date = date_to_string(date)
    shifts = ShiftGenerator.new(key, date).shifts
    { encryption: encrypt_message(message, shifts), key: key, date: date }
  end

  def decrypt(message, key, date = Time.now)
    date = date_to_string(date)
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
