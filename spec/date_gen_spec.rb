require './lib/date_gen'
require 'time'

RSpec.describe DateGen do
  describe '#initialize' do
    it 'exists and has a readable attribute' do
      allow(Time).to receive(:now).and_return '010122'
      dategen1 = DateGen.new()
      expect(dategen1).to be_a DateGen
      expect(dategen1.date).to eq '010122'
    end
  end

  describe '#date_to_offset' do
    it 'transforms a date string to an array of offsets' do
      dategen1 = DateGen.new('010122')
      dategen2 = DateGen.new('020222')
      expect(dategen1.date_to_offset).to eq([4, 8, 8, 4])
      expect(dategen2.date_to_offset).to eq([9, 2, 8, 4])
    end
  end

  describe '#date_to_string' do
    it 'formats date as DDMMYY' do
      date1 = Time.new(2022)
      date2 = Time.new(2003, 5, 23)
      date3 = nil
      dategen1 = DateGen.new(date1)
      dategen2 = DateGen.new(date2)
      dategen3 = DateGen.new(date3)
      dategen4 = DateGen.new()
      expect(dategen1.date).to eq '010122'
      expect(date2.date_to_string(date2)).to eq '230503'
    end
  end
end
