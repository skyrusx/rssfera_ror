# EmploymentTypes
puts "Seeding Employment Types..."

EmploymentType.delete_all

employment_types = [
  { name: "Возможна подработка: сменами по 4-6 часов", status: true },
  { name: "Возможна подработка: сменами по 4-6 часов или по вечерам", status: true },
  { name: "Полная занятость, полный день", status: true },
  { name: "Стажировка, полный день", status: true },
  { name: "Частичная занятость, полный день", status: true }
]

employment_types.each do |employment_type|
  EmploymentType.find_or_create_by(employment_type)
  puts "Тип занятости создан: #{employment_type[:name]}"
end

puts "Seeding Employment Types completed!\r\n\r\n"
# EmploymentTypes End
