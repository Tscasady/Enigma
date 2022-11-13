# frozen_string_literal: true

require './lib/enigma'
require './lib/shift_generator'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }
  describe '#initialize' do
    it 'exists and has a character_set' do
      expect(enigma).to be_a Enigma
      expect(enigma.character_set.length).to eq 27
    end
  end

  describe '#generate_key' do
  it 'creates a random number 5 digit number as a string to use as a key' do
    key1 = enigma.generate_key
    key2 = enigma.generate_key
    expect(key1).to be_a String
    expect(key1.length).to eq 5
    expect(key2.length).to eq 5
    expect(key1 == key2).to be false
  end
end

  describe '#encrypt' do
    it 'returns a hash containing an encrypted message, key, and date' do
      expect(enigma.encrypt('test', '12345', '010122')).to eq({
                                                                encryption: 'iigo',
                                                                key: '12345',
                                                                date: '010122'
                                                              })
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq({
                                                                       encryption: 'keder ohulw',
                                                                       key: '02715',
                                                                       date: '040895'
                                                                     })
    end
  end

  describe '#decrypt' do
    it 'decrypts a message' do
      expect(enigma.decrypt('iigo', '12345', '010122')).to eq({
                                                                decryption: 'test',
                                                                key: '12345',
                                                                date: '010122'
                                                              })
      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq({
                                                                       decryption: 'hello world',
                                                                       key: '02715',
                                                                       date: '040895'
                                                                     })
    end
  end

  describe '#encrypt_message' do
    it 'encrypts a message' do
      shifts = ShiftGenerator.new('12345', '010122').shifts
      expect(enigma.encrypt_message('test', shifts)).to eq 'iigo'
      shifts = ShiftGenerator.new('02715', '040895').shifts
      expect(enigma.encrypt_message('hello world', shifts)).to eq 'keder ohulw'
    end
  end

  describe '#decrypt_message' do
    it 'decrypts a message' do
      shifts = ShiftGenerator.new('12345', '010122').shifts
      expect(enigma.decrypt_message('iigo', shifts)).to eq 'test'
    end
  end
end
