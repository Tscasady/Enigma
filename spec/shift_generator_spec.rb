# frozen_string_literal: true

require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  # let(:shift) { ShiftGenerator.new('12345', '010122') }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      cipher = double('cipher')
      shift1 = ShiftGenerator.new(3, cipher)
      shift2 = ShiftGenerator.new(2, cipher)
      expect(shift1).to be_a ShiftGenerator
      expect(shift1.shift_order).to eq 3
      expect(shift2.shift_order).to eq 2
    end
  end

  describe '#key_to_shift_part' do
    it 'transforms the key into 4 separate values for the shift' do
      cipher1 = double('cipher')
      allow(cipher1).to receive(:keys).and_return('12345')
      cipher2 = double('cipher')
      allow(cipher2).to receive(:keys).and_return('67899')
      shift1 = ShiftGenerator.new(3, cipher1)
      shift2 = ShiftGenerator.new(2, cipher2)
      expect(shift1.key_to_shift_part).to eq [12, 23, 34, 45]
      expect(shift2.key_to_shift_part).to eq [67, 78, 89, 99]
    end
  end

  describe '#shifts' do
    it 'adds key_shifts and offsets to produce final shifts' do
      cipher1 = double('cipher')
      allow(cipher1).to receive(:get_offset).and_return([4, 8, 8, 4])
      allow(cipher1).to receive(:keys).and_return('12345')
      cipher2 = double('cipher')
      allow(cipher2).to receive(:get_offset).and_return([9, 2, 8, 4])
      allow(cipher2).to receive(:keys).and_return('67899')
      shift1 = ShiftGenerator.new(3, cipher1)
      shift2 = ShiftGenerator.new(2, cipher2)
      expect(shift1.shifts).to eq([16, 31, 42, 49])
      expect(shift2.shifts).to eq([76, 80, 97, 103])
    end
  end

  describe '#crack_shift' do
    it 'rotates the target_indicies array by the given amount' do
      cipher = double('cipher')
      shift1 = ShiftGenerator.new(3, cipher)
      shift2 = ShiftGenerator.new(2, cipher)
      expect(shift1.crack_shift).to eq [3, 27, 4, 13]
      expect(shift2.crack_shift).to eq [13, 3, 27, 4]
    end
  end

  describe '#offsets' do
    it 'fetches offsets from the cipher' do
      cipher = double('cipher')
      allow(cipher).to receive(:get_offset).and_return([4, 8, 8, 4])
      shift = ShiftGenerator.new(2, cipher)
      expect(shift.offsets).to eq [4, 8, 8, 4]
    end
  end

  describe '#keys' do
    it 'fetches keys from the cipher' do
      cipher = double('cipher')
      allow(cipher).to receive(:keys).and_return('12345')
      shift = ShiftGenerator.new(2, cipher)
      expect(shift.keys).to eq ('12345')
    end
  end
end
