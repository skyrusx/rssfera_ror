# Skills
puts "Seeding Skills..."

Skill.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE skills RESTART IDENTITY")

skills = [
  { name: "Агентские продажи", status: true },
  { name: "Активные продажи", status: true },
  { name: "Без опыта", status: true },
  { name: "Деловая коммуникация", status: true },
  { name: "Деловая этика", status: true },
  { name: "Деловое общение", status: true },
  { name: "Заключение договоров", status: true },
  { name: "Коммерческая недвижимость", status: true },
  { name: "Коммуникабельность", status: true },
  { name: "Навыки переговоров", status: true },
  { name: "Начало карьеры", status: true },
  { name: "Недвижимость", status: true },
  { name: "Обучение и развитие", status: true },
  { name: "Поиск и привлечение клиентов", status: true },
  { name: "Работа с большим объемом информации", status: true }
]

skills.each do |skill|
  Skill.find_or_create_by(skill)
  puts "Навык создан: #{skill[:name]}"
end

puts "Seeding Skills completed!\r\n\r\n"
# Skills End
