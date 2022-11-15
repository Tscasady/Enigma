require './lib/key_gen'

RSpec.describe KeyGen do
  describe '#initialize' do
    it 'exists and has readable attributes' do
      cipher = double('cipher')
      KeyGen.any_instance.stub(:generate_key).and_return '67899'
      keygen1 = KeyGen.new(cipher, '12345')
      keygen2 = KeyGen.new(cipher)
      expect(keygen1).to be_a KeyGen
      expect(keygen1.key).to eq '12345'
      expect(keygen2.key).to eq '67899'
    end
  end

  describe '#generate_key' do
    it 'creates a random number 5 digit number as a string to use as a key' do
      cipher = double('cipher')
      keygen = KeyGen.new(cipher)
      key1 = keygen.generate_key
      key2 = keygen.generate_key
      expect(key1).to be_a String
      expect(key1.length).to eq 5
      expect(key2.length).to eq 5
      expect(key1 == key2).to be false
    end
  end

  describe '#find_shift_difference' do
    it 'can return a key used for a given method' do
      cipher = double('cipher')
      allow(cipher).to receive(:message).and_return 'test'
      allow(cipher).to receive(:crack_shift).and_return [27, 4, 13, 3]
      allow(cipher).to receive(:character_set).and_return (("a".."z").to_a << " ")
      keygen = KeyGen.new(cipher)
      expect(keygen.find_shift_difference).to eq [-8, 0, 5, 16]
    end
  end

  describe '#fetch_ordered_offset' do
    it 'retrieves the date from the cipher' do
      cipher = double('cipher')
      allow(cipher).to receive(:ordered_offset).and_return [4, 8, 8, 4]
      keygen = KeyGen.new(cipher)
      expect(keygen.fetch_ordered_offset).to eq [4, 8, 8, 4]
    end
  end

  describe '#fetch_crack_shift' do
    it 'retrieves crack_shift from cipher' do
      cipher = double('cipher')
      allow(cipher).to receive(:crack_shift).and_return [27, 4, 13, 3]
      keygen = KeyGen.new(cipher)
      expect(keygen.fetch_crack_shift).to eq [27, 4, 13, 3]
    end
  end

  describe '#crack_key_gen' do
    it 'returns an array of values that can be translated to a key' do
      cipher = double('cipher')
      keygen = KeyGen.new(cipher)
      allow(keygen).to receive(:find_shift_difference).and_return [-8, 0, 5, 16]
      allow(cipher).to receive(:ordered_offset).and_return [4, 8, 8, 4]
      expect(keygen.crack_key_gen).to eq []
    end
  end
end
