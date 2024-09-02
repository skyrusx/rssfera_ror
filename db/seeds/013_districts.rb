# Districts
puts "Seeding Districts..."

District.delete_all

districts = {
  "Мурманск" => [
    { name: "Ленинский" },
    { name: "Октябрьский" },
    { name: "Первомайский" },
  ],
  "Мурмаши" => [{ name: "Кольский" }],
  "Умба" => [{ name: "Терский" }]
}

districts.each do |city_name, data|
  city = City.find_by_name(city_name)

  data.each do |district_data|
    district = District.find_or_create_by(district_data)
    district.city_id = city.id
    district.save
    puts "Регион создан: #{district.name}"
  end
end

puts "Seeding Districts completed!\r\n\r\n"
# Districts End
