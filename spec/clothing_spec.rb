require 'rspec'
require_relative '../lib/clothing'

describe '.from_file(file_path)' do
  before do
    @clothing = Clothing.from_file(__dir__ + '/../data/01.txt')
  end

  it 'should return instance of class Clothing' do
    expect(@clothing).to be_an_instance_of(Clothing)
  end

  it 'should fill attributes: name, type, max_temp, min_temp' do
    expect(@clothing.type).to eql('Головной убор')
    expect(@clothing.name).to eql('Шапка-ушанка')
    expect(@clothing.max_temp).to eql(-20)
    expect(@clothing.min_temp).to eql(-5)
  end
end

describe '.to_s' do
  before do
    @clothing = Clothing.from_file(__dir__ + '/../data/01.txt')
  end

  it 'should return a string file containing attributes: name, tyep, max_temp, min_temp' do
    expect(@clothing.to_s).to eql('Шапка-ушанка (Головной убор) -20..-5')
  end
end
