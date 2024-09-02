# JobTitles
puts "Seeding Job Titles..."

JobTitle.delete_all

job_titles = [
  { name: "HR Менеджер", status: true },
  { name: "Агент по недвижимости", status: true },
  { name: "Агент по продаже недвижимости", status: true },
  { name: "Администратор", status: true },
  { name: "Ипотечный брокер", status: true },
  { name: "Маркетолог", status: true },
  { name: "Менеджер по аренде недвижимости", status: true },
  { name: "Менеджер по земельным участкам", status: true },
  { name: "Менеджер по недвижимости", status: true },
  { name: "Менеджер по продажам", status: true },
  { name: "Менеджер по продаже недвижимости", status: true },
  { name: "Помощник риелтора", status: true },
  { name: "Помощник руководителя", status: true },
  { name: "Риелтор", status: true },
  { name: "Руководитель", status: true },
  { name: "Руководитель отдела продаж", status: true },
  { name: "Специалист по аренде", status: true },
  { name: "Специалист по недвижимости", status: true },
  { name: "Специалист по работе с недвижимостью", status: true },
  { name: "Стажёр по недвижимости", status: true }
]

job_titles.each do |job_title|
  JobTitle.find_or_create_by(job_title)
  puts "Должность создана: #{job_title[:name]}"
end

puts "Seeding Job Titles completed!\r\n\r\n"
# JobTitles End
