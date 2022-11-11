# frozen_string_literal: true

require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  # let(:shift) { ShiftGenerator.new('12345', '010122') }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      shift1 = ShiftGenerator.new('12345', '010122')
      shift2 = ShiftGenerator.new('67899', '020222')
      expect(shift1).to be_a ShiftGenerator
      expect(shift1.key).to eq '12345'
      expect(shift1.date).to eq '010122'
      expect(shift2.key).to eq '67899'
      expect(shift2.date).to eq '020222'
    end
  end

  describe '#generate_key' do
    it 'creates a random number 5 digit number as a string to use as a key' do
      shift = ShiftGenerator.new('010122')
      key1 = shift.key
      key2 = shift.generate_key
      expect(key1).to be_a String
      expect(key1.length).to eq 5
      expect(key2.length).to eq 5
    end
  end

  describe '#key_to_shifts' do
    it 'transforms the key into 4 separate values for the shift' do
      shift1 = ShiftGenerator.new('12345', '010122')
      shift2 = ShiftGenerator.new('67899', '020222')
      expect(shift1.key_to_shifts).to eq [12, 23, 34, 45]
      expect(shift2.key_to_shifts).to eq [67, 78, 89, 99]
    end
  end

  describe '#date_to_offset' do
    it 'transforms a date string to an array of offsets' do
      shift1 = ShiftGenerator.new('12345', '010122')
      shift2 = ShiftGenerator.new('67899', '020222')
      expect(shift1.date_to_offset).to eq([4, 8, 8, 4])
      expect(shift2.date_to_offset).to eq([9, 2, 8, 4])
    end
  end

  describe '#shifts' do
    it 'adds key_shifts and offsets to produce final shifts' do
      shift1 = ShiftGenerator.new('12345', '010122')
      shift2 = ShiftGenerator.new('67899', '020222')
      expect(shift1.shifts).to eq ([16, 31, 42, 49])
      expect(shift2.shifts).to eq([76, 80, 97, 103])
    end
  end
end
