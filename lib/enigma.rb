# frozen_string_literal: true

require 'time'
require './lib/cipher'

# This class injects a Cipher with data to transform messages
class Enigma
  attr_reader :character_set

  def encrypt(message, key, date)
    prefix = __method__.to_s[0..1]
    Cipher.new(message, key, date, prefix).output
  end

  def decrypt(message, key, date)
    prefix = __method__.to_s[0..1]
    Cipher.new(message, key, date, prefix).output
  end

  # def crack(message, date = Time.now)
  #   decrypt(message, date)
  # end
end
