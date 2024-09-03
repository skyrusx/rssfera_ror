# SocialLinks
puts "Seeding Social Links..."

SocialLink.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE social_links RESTART IDENTITY")

social_links = [
  { name: "ВКонтакте", status: true, link: "https://vk.com/rssfera" },
  { name: "Телеграм", status: true, link: "https://t.me/rssfera" },
  { name: "Avito", status: true, link: "https://www.avito.ru/brands/i7334388" }
]

social_links.each do |social_link|
  SocialLink.find_or_create_by(social_link)
  puts "Соц сеть создана: #{social_link[:name]}"
end

puts "Seeding Social Links completed!\r\n\r\n"
# SocialLinks End
