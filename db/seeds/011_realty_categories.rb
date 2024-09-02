# RealtyCategories
puts "Seeding Realty Categories..."

RealtyCategory.delete_all

realty_categories = [
  { name: "Аренда", status: true },
  { name: "Продажа", status: true }
]

realty_categories.each do |category|
  RealtyCategory.find_or_create_by(category)
  puts "Категория недвижимости создана: #{category[:name]}"
end

puts "Seeding Realty Categories completed!\r\n\r\n"
# RealtyCategories End
