# frozen_string_literal: true

require './lib/enigma'

RSpec.describe Enigma do
  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(enigma).to be_a Enigma
      expect(enigma.key).to eq ''
      expect(enigma.date).to eq ''
    end
  end

  describe '#encrypt' do
    it 'returns a hash containing an encrypted message, key, and date' do
      expect(enigma.encrypt('encrypt test', '12345', '010122')).to eq({
                                                                        encryption: '',
                                                                        key: '',
                                                                        date: 'd' })
      expect(enigma.encrypt('a different test', '67899', '020222')).to eq({
                                                                            encryption: '',
                                                                            key: '',
                                                                            date: 'd'
                                                                          })
    end
  end
end
