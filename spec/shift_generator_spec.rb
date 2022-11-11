# frozen_string_literal: true

require './lib/shift_generator'

Rspec.describe ShiftGenerator do
  let(:shift) { ShiftGenerator.new('12345', '010122') }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(shift.key).to eq '12345'
      expect(shift.date).to eq '010122'
    end
  end
end
