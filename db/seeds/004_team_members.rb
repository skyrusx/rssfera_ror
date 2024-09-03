# TeamMembers
puts "Seeding Team Members..."

TeamMember.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE team_members RESTART IDENTITY")

TeamMemberJobTitleJoin.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE team_member_job_title_joins RESTART IDENTITY")

team_members = [
  {
    first_name: "Дмитрий", last_name: "Кулишов", patronymic_name: "Александрович", rating: 0.0,
    phone: "+7 (902) 281-05-33", email: "kul996@mail.ru", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Ирина", last_name: "Кулишова", patronymic_name: "Александровна", rating: 0.0,
    phone: "+7 (911) 323-86-00", email: "ikulishova73@gmail.com", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Наталия", last_name: "Волошина", patronymic_name: "Александровна", rating: 0.0,
    phone: "+7 (953) 757-56-23", email: "voloshinana74@gmail.com", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Светлана", last_name: "Фомченко", patronymic_name: "Николаевна", rating: 0.0,
    phone: "+7 (902) 281-77-27", email: "man-fomsv@yandex.ru", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Илья", last_name: "Новожилов", patronymic_name: "Витальевич", rating: 0.0,
    phone: "+7 (911) 323-86-51", email: "noivital09@gmail.com", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Светлана", last_name: "Захарова", patronymic_name: "Олеговна", rating: 0.0,
    phone: "+7 (952) 295-88-38", email: "rssfera@mail.ru", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Ксения", last_name: "Медведева", patronymic_name: "Викторовна", rating: 0.0,
    phone: "+7 (916) 942-24-35", email: "kvmedvedevarss@mail.ru", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
  {
    first_name: "Мария", last_name: "Павлова", patronymic_name: "Александровна", rating: 0.0,
    phone: "+7 (911) 302-95-85", email: "mapavlovarss@mail.ru", whatsapp: true, status: true,
    info: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.</p>
    HTML
  },
]

positions = {
  "Кулишов Дмитрий Александрович" => "Руководитель, Менеджер по продаже недвижимости",
  "Кулишова Ирина Александровна" => "Руководитель отдела продаж, Менеджер по продажам, Ипотечный брокер",
  "Волошина Наталия Александровна" => "Специалист по аренде, Специалист по недвижимости",
  "Фомченко Светлана Николаевна" => "Менеджер по недвижимости, Менеджер по земельным участкам",
  "Новожилов Илья Витальевич" => "HR Менеджер, Маркетолог, Специалист по недвижимости",
  "Захарова Светлана Олеговна" => "Администратор, Помощник руководителя",
  "Медведева Ксения Викторовна" => "Агент по недвижимости",
  "Павлова Мария Александровна" => "Агент по недвижимости"
}

team_members.each.with_index(1) do |team_member_data, index|
  team_member = TeamMember.find_or_create_by(team_member_data)

  team_member.photo.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/team/team-0#{index}.png")),
    filename: "team-0#{index}.png"
  )

  position_names = positions[team_member.whole_name].split(", ")
  position_ids = JobTitle.where(name: position_names).pluck(:id)
  team_member.job_title_ids = position_ids

  review_ids = Review.where(team_member_id: team_member.id).pluck(:id)
  team_member.review_ids = review_ids
  team_member.save

  puts "Сотрудник создан: #{team_member.whole_name}"
end

puts "Seeding Team Members completed!\r\n\r\n"
# TeamMembers End
