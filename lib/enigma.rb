# frozen_string_literal: true

require 'time'
require './lib/shift_generator'
# This class encrypts messages
class Enigma
  attr_reader :character_set

  def encrypt(message, key, date)
    prefix = __method__.to_s[0..2]
    Cipher.new(message, key, date, prefix).transform_message
  end

  def decrypt(message, key, date)
    prefix = __method__.to_s[0..2]
    Cipher.new(message, key, date, prefix).transform_message
  end

  def crack(message, date = Time.now)
    decrypt(message, date)
  end
end
