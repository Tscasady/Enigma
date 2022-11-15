# frozen_string_literal: true

require './lib/enigma'
require './lib/shift_generator'
require 'time'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }
  describe '#initialize' do
    it 'exists and has a character_set' do
      expect(enigma).to be_a Enigma
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

  describe '#crack' do
    it 'returns a hash containt a message, key, and date' do

    end
  end
end
