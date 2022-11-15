# frozen_string_literal: true

require 'time'
require './lib/shift_generator'
# This class encrypts messages
class Enigma
  attr_reader :character_set

  def initialize
    @cipher = Cipher.new
  end

  def encrypt(message, key = generate_key, date = Time.now)
    prefix = __method__.to_s[0..2]
    cipher.transform_message(message, key, date, prefix, '+')
  end

  def decrypt(message, key = generate_key, date = Time.now)
    prefix = __method__.to_s[0..2]
    cipher.transform_message(message, key, date, prefix, '-')
  end

  def crack(message, date = Time.now)
    decrypt(message, date)
  end
end
