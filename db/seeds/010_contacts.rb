# Contacts
puts "Seeding Contacts..."

Contact.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE contacts RESTART IDENTITY")

contacts = [
  {
    address_full: "183025, г. Мурманск, ул. Полярные Зори, 44, 2 этаж (вход со двора)",
    address_short: "г. Мурманск, ул.Полярные Зори, д. 44",
    phone: "+7 (953) 754-16-23",
    email: "rssfera@mail.ru",
    work_schedule: {
      1 => { "day" => "monday", "start" => "09:00", "end" => "19:00" },
      2 => { "day" => "tuesday", "start" => "09:00", "end" => "19:00" },
      3 => { "day" => "wednesday", "start" => "09:00", "end" => "19:00" },
      4 => { "day" => "thursday", "start" => "09:00", "end" => "19:00" },
      5 => { "day" => "friday", "start" => "09:00", "end" => "19:00" },
      6 => { "day" => "saturday", "start" => "10:00", "end" => "18:00" },
      7 => { "day" => "sunday", "start" => "", "end" => "" }
    },
    self_emloyed: "ИП Кулишов Дмитрий Александрович",
    inn: "ИНН 519030367637"
  }
]

contacts.each do |contact|
  Contact.find_or_create_by(contact)
  puts "Контактные данные созданы"
end

puts "Seeding Contacts completed!\r\n\r\n"
# Contacts End
