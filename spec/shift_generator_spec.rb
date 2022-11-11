# frozen_string_literal: true

require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  let(:shift) { ShiftGenerator.new('12345', '010122') }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(shift).to be_a ShiftGenerator
      expect(shift.key).to eq '12345'
      expect(shift.date).to eq '010122'
    end
  end

  describe '#generate_key' do
    it 'creates a random number 5 digit number as a string to use as a key' do
      key1 = shift.key
      key2 = shift.key
      expect(key1).to be_a String
      expect(key1.length).to eq 5
      expect(key2.length).to eq 5
    end
  end
end
