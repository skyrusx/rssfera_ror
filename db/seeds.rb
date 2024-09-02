puts "Seeding Start..."

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Обработка #{file.split('/').last}"
  require file
end

puts "Seeding completed!"
