# Cities
puts "Seeding Cities..."

City.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE cities RESTART IDENTITY")

cities = [
  { name: "Мурманск", status: true },
  { name: "Мурмаши", status: true },
  { name: "Умба", status: true }
]

cities.each do |city|
  City.find_or_create_by(city)
  puts "Город создан: #{city[:name]}"
end

puts "Seeding Cities completed!\r\n\r\n"
# Cities End
