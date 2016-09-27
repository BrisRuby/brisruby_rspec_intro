require 'rspec'

class Calc
  attr_reader :accumulator

  def initialize x
    @accumulator = x
  end

  def increment
    @accumulator += 1
  end

  def accumulator_zero?
    accumulator == 0
  end
end

describe Calc do
  describe '#accumulator_zero?' do
    it 'is zero' do
      new_calc = Calc.new(0)
      expect(new_calc.accumulator_zero?).to be_truthy
      # alternative
      expect(new_calc).to be_accumulator_zero
    end
    it 'is not zero' do
      new_calc = Calc.new(10)
      expect(new_calc.accumulator_zero?).to be_falsy
      # alternative
      expect(new_calc).to_not be_accumulator_zero
    end
  end

  context 'increment accumulator' do
    it 'brittle test' do
      new_calc = Calc.new(10)
      expect(new_calc.increment).to eq(11)
    end
    it 'non brittle test' do
      new_calc = Calc.new(10)
      expect do
        new_calc.increment
      end.to change { new_calc.accumulator }.by(1)
    end
  end

  context 'setting accumulator' do
    it 'to 10' do
      new_calc = Calc.new(10)
      expect(new_calc.accumulator).to eq(10)
    end
    it 'to 20' do
      new_calc = Calc.new(20)
      expect(new_calc.accumulator).to eq(20)
    end
  end
end
