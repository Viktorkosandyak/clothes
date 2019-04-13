require_relative 'lib/clothing'
require_relative 'lib/wardrob'

file_path = __dir__ + '/data'

file_paths = Dir[file_path + "/*.txt"]

wardrob = Wardrob.from_dir(Clothing, file_paths)

puts "Сколько градусов за окном? (можно с минусом)"

user_input = gets.chomp
until user_input =~ /^[\+\-](\d)/ || user_input =~ /^(\d)/
  puts "Введите цифру"
  user_input = gets.chomp
end

user_input = user_input.to_i

suitable_clothes = wardrob.get_suitable_clothing(user_input)

puts
puts "Предлагаем сегодня надеть:"
puts

suitable_clothes.each do |clothing|
  puts clothing
end
