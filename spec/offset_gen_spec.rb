require './lib/offset_gen'
require 'time'

RSpec.describe OffsetGen do
  describe '#initialize' do
    it 'exists and has a readable attribute' do
      cipher = double('cipher')
      allow(Time).to receive(:now).and_return '010122'
      offset1 = OffsetGen.new(cipher, nil)
      expect(offset1).to be_a OffsetGen
      expect(offset1.date).to eq '010122'
    end
  end

  describe '#date_to_offset' do
    it 'transforms a date string to an array of offsets' do
      cipher = double('cipher')
      offset1 = OffsetGen.new(cipher, '010122')
      offset2 = OffsetGen.new(cipher, '020222')
      expect(offset1.date_to_offset).to eq([4, 8, 8, 4])
      expect(offset2.date_to_offset).to eq([9, 2, 8, 4])
    end
  end

  describe '#date_to_string' do
    it 'formats date as DDMMYY' do
      cipher = double('cipher')
      date1 = Time.new(2022)
      date2 = Time.new(2003, 5, 23)
      date3 = nil
      offset1 = OffsetGen.new(cipher, date1)
      offset2 = OffsetGen.new(cipher, date2)

      allow(Time).to receive(:now).and_return '010122'
      offset3 = OffsetGen.new(cipher, date3)
      offset4 = OffsetGen.new(cipher)
      expect(offset1.date).to eq '010122'
      expect(offset2.date).to eq '230503'
      expect(offset3.date).to eq '010122'
      expect(offset4.date).to eq '010122'
    end
  end
end
