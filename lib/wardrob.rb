class Wardrob
  attr_reader :collection

  def initialize(collection = [])
    @collection = collection
  end

  def self.from_dir(clothing, file_dir)
    collection = []
    file_dir.each do |file_path|
      collection << clothing.from_file(file_path)
    end
    new(collection)
  end

  def get_suitable_clothing(temperature)
    suitable_clothes = []
    @collection.each do |clothing|
      if temperature.between?(clothing.max_temp, clothing.min_temp)
        suitable_clothes << clothing
      elsif temperature > 40 || temperature < -20
        abort "nothing will help you. You will die"
      end

    end
    suitable_clothes
  end
end
