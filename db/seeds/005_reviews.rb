# Reviews
puts "Seeding Reviews..."

Review.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE reviews RESTART IDENTITY")

reviews = [
  {
    author: "Иван Иванов", email: "ivan-ivanov@gmail.com", rating: "4.0", status: "new",
    created_at: DateTime.new(2023, 01, 02, 15, 10, 12), published_at: "",
    feedback: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>
    HTML
  },
  {
    author: "Анастасия", email: "anastasiya@gmail.com", rating: "5.0", status: "new",
    created_at: DateTime.new(2022, 11, 30, 20, 03, 27), published_at: "",
    feedback: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>
    HTML
  },
  {
    author: "Сергей Сергеевич", email: "sergej-sergeevich@gmail.com", rating: "4.5", status: "new",
    created_at: DateTime.new(2022, 9, 01, 19, 43, 54), published_at: "",
    feedback: <<-HTML
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>
    HTML
  }
]

reviews.each.with_index(1) do |review_data, index|
  (1..8).each do |subindex|
    review = Review.find_or_create_by(review_data)

    filename = case index
               when 1 then "avatar-06.png"
               when 2 then "avatar-01.png"
               else "avatar-02.png"
               end

    review.avatar.attach(
      io: File.open(File.join(Rails.root, "app/assets/images/avatar/#{filename}")),
      filename: filename
    )

    tm_last_name = case subindex
                   when 1 then "Кулишов"
                   when 2 then "Кулишова"
                   when 3 then "Волошина"
                   when 4 then "Фомченко"
                   when 5 then "Новожилов"
                   when 6 then "Захарова"
                   when 7 then "Медведева"
                   else "Стрелец"
                   end

    team_member = TeamMember.find_by_last_name(tm_last_name)
    review.team_member_id = team_member.id
    review.save
  end

  puts "Отзыв создан: #{review_data[:author]}"
end

puts "Seeding Reviews completed!\r\n\r\n"
# Reviews End
