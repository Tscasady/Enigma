require './lib/cipher'

RSpec.describe Cipher do
  describe '#initilaize' do
    it 'exists and has readable attributes' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher1).to be_a Cipher
      expect(cipher1.shifts[0]).to eq 'a'
      expect(cipher2.shifts[0]).to eq 'a'
    end
  end

  describe '#transform_message' do
    it 'can transform a message with the given shift' do
      cipher1 = Cipher.new('test', '12345', '010122', 'en')
      cipher2 = Cipher.new('keder ohulw', '02715', '040895', 'de')
      expect(cipher1.transform_message).to eq({
        encryption: 'iigo',
        key: '12345',
        date: '010122'
      })
      expect(cipher2.transform_message).to eq({
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
end
