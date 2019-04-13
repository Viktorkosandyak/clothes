require 'rspec'

require_relative '../lib/wardrob'
require_relative '../lib/clothing'

describe '.from_dir(clothing, file_path)' do
  let(:wardrob) do
    files_dir = ["#{__dir__}/../data/01.txt", "#{__dir__}/../data/04.txt"]
    Wardrob.from_dir(Clothing, files_dir)
  end

  it 'should return array of Clothing collections' do
    expect(wardrob.collection).to be_an_instance_of(Array)
  end

  it 'returns the instance of Clothing from collection Array' do
    expect(wardrob.collection.first).to be_an_instance_of(Clothing)
  end

  it 'should return the attributes of Clothing: name, type, max_temp, min_temp' do
    expect(wardrob.collection.first.name).to eq("Шапка-ушанка")
    expect(wardrob.collection.first.type).to eq("Головной убор")
    expect(wardrob.collection.first.max_temp).to eq(-20)
    expect(wardrob.collection.first.min_temp).to eq(-5)
  end
end

describe '.get_suitable_clothing(temperature)' do
  let(:wardrob) do
    files_dir = ["#{__dir__}/../data/01.txt", "#{__dir__}/../data/04.txt"]
    Wardrob.from_dir(Clothing, files_dir)
  end

  let(:clothes) do
    wardrob.get_suitable_clothing(-5)
  end

  it 'should return an array of instances' do
    expect(clothes).to be_an_instance_of(Array)
  end

  it 'should return clothing which suites to -5 parameter' do
    expect(clothes.first.name).to eq('Шапка-ушанка')
    expect(clothes.last.name).to eq('Джинсы')
    expect(clothes.first.min_temp).to eq(-5)
    expect(clothes.first.min_temp).to eq(-5)
  end
end
