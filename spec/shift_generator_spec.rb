# frozen_string_literal: true

require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  # let(:shift) { ShiftGenerator.new('12345', '010122') }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      shift1 = ShiftGenerator.new('12345', '010122', 3)
      shift2 = ShiftGenerator.new('67899', '020222', 2)
      expect(shift1).to be_a ShiftGenerator
      expect(shift1.key).to eq '12345'
      expect(shift1.offset.date).to eq '010122'
      expect(shift1.shift_order).to eq 3
      expect(shift2.key).to eq '67899'
      expect(shift2.offset.date).to eq '020222'
      expect(shift2.shift_order).to eq 2
    end
  end

  describe '#key_to_shift_part' do
    it 'transforms the key into 4 separate values for the shift' do
      shift1 = ShiftGenerator.new('12345', '010122', 3)
      shift2 = ShiftGenerator.new('67899', '020222', 2)
      expect(shift1.key_to_shift_part).to eq [12, 23, 34, 45]
      expect(shift2.key_to_shift_part).to eq [67, 78, 89, 99]
    end
  end

  describe '#shifts' do
    it 'adds key_shifts and offsets to produce final shifts' do
      shift1 = ShiftGenerator.new('12345', '010122', 3)
      shift2 = ShiftGenerator.new('67899', '020222', 2)
      expect(shift1.shifts).to eq([16, 31, 42, 49])
      expect(shift2.shifts).to eq([76, 80, 97, 103])
    end
  end

  describe '#crack_shift' do
    it 'rotates the target_indicies array by the given amount' do
      shift1 = ShiftGenerator.new('12345', '010122', 3)
      shift2 = ShiftGenerator.new('67899', '020222', 2)
      expect(shift1.crack_shift).to eq [3, 27, 4, 13]
      expect(shift2.crack_shift).to eq [13, 3, 27, 4]
    end
  end
end
