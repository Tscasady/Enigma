require './lib/key_gen'

RSpec.describe KeyGen do
  describe '#initialize' do
    it 'exists and has readable attributes' do
      KeyGen.any_instance.stub(:generate_key).and_return '67899'
      keygen1 = KeyGen.new('12345')
      keygen2 = KeyGen.new()
      expect(keygen1).to be_a KeyGen
      expect(keygen1.key).to eq '12345'
      expect(keygen2.key).to eq '67899'
    end
  end

  describe '#generate_key' do
    it 'creates a random number 5 digit number as a string to use as a key' do
      keygen = KeyGen.new
      key1 = keygen.generate_key
      key2 = keygen.generate_key
      expect(key1).to be_a String
      expect(key1.length).to eq 5
      expect(key2.length).to eq 5
      expect(key1 == key2).to be false
    end
  end

  describe '#find_key' do
    it 'can return a key with a given date and shift' do
      
    end
  end
end