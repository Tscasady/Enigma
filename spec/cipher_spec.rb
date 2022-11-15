require './lib/cipher'

RSpec.describe Cipher do
  describe '#initilaize' do
    it 'exists and has readable attributes' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher1).to be_a Cipher
      expect(cipher1.keys).to eq '12345'
      expect(cipher2.keys).to eq '02715'
    end
  end

  describe '#transform_message' do
    it 'can transform a message with the given shift' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher1.transform_message).to eq('iigo')
      expect(cipher2.transform_message).to eq('hello world')
    end
  end

  describe '#output' do
    it 'returns message and data in a hash' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher1.output).to eq({
        encryption: 'iigo',
        key: '12345',
        date: '010122'
      })
      expect(cipher2.output).to eq({
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      })
    end
  end

  describe '#shift_order' do
    it 'returns a number between 0-3 based on message length' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      expect(cipher1.shift_order).to eq 0
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher2.shift_order).to eq 3
    end
  end

  describe '#get_offset' do
    it 'returns an array of offsets' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      expect(cipher1.get_offset).to eq [4, 8, 8, 4]
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher2.get_offset).to eq [1, 0, 2, 5]
    end
  end

  describe '#ordered_offset' do
    it 'returns the shifted offset for crack calculations' do
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher2.ordered_offset).to eq [5, 1, 0, 2]
    end
  end

  describe '#crack_shift' do
    it 'fetches the crack_shift from the shift gen' do
      
    end
  end
end
