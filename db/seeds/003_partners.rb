# Partners
puts "Seeding Partners..."

Partner.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE partners RESTART IDENTITY")

partners = [
  {
    status: true, name: "Сбербанк", anchor: "sber",
    description: <<-HTML
<p>Является крупнейшим банком Российской Федерации и стран СНГ.</p>
<p>Сбербанк – современный универсальный коммерческий банк, удовлетворяющий потребности различных групп населения в широком спектре банковских услуг, включая ипотечное кредитование.</p>
<p>ООО АН РиелтСтройСфера и Мурманское отделение № 8627 ПАО Сбербанк заключили договор о взаимодействии, направленный на привлечение физических лиц – потенциальных клиентов, желающих получить кредит на цели приобретения объектов недвижимости в г. Мурманске, в соответствии с реализуемыми ПАО Сбербанк программами кредитования.</p>
<p>В рамках сотрудничества наша компания способна предложить всем физическим лицам, а также нашим клиентам возможность стать заемщиком ПАО Сбербанк прямо в нашем офисе!</p>
<p>Любой клиент может обратиться в наше агентство недвижимости и в офисе агентства получить консультацию по Ипотечным программам ПАО Сбербанк и оформить заявку на ипотеку.</p>
    HTML
  },
  {
    status: true, name: "Банк ВТБ", anchor: "vtb",
    description: <<-HTML
<p>Банк ВТБ входит в международную финансовую группу ВТБ и специализируются на обслуживании физических лиц, индивидуальных предпринимателей и предприятий малого бизнеса.</p>
<p>Сеть банка формируют 1062 офиса в 72 регионах страны. ВТБ предлагают клиентам основные банковские продукты, принятые в международной финансовой практике.</p>
<p>В числе предоставляемых услуг: выпуск банковских карт, ипотечное и потребительское кредитование, автокредитование, услуги дистанционного управления счетами, кредитные карты с льготным периодом, срочные вклады, аренда сейфовых ячеек, денежные переводы.</p>
<p>В тесном сотрудничестве ВТБ с Агентством Недвижимости "РиелтСтройСфера" c начала 2014 года.</p>
<p>В Агентстве Недвижимости "РиелтСтройСфера" квалифицированные сотрудники предоставят вам полную консультацию о предоставляемых услугах банка, а также в сопровождении сделок с недвижимостью с использованием ипотечного кредитования, предоставляемого банком ВТБ, на выгодных условиях для наших клиентов.</p>
    HTML
  },
  {
    status: true, name: "Альфа-Банк", anchor: "alfabank",
    description: <<-HTML
<p>Один из крупнейших частных банков России, занимающий четвертую строчку в рейтинге отечественных банков по размеру активов.</p>
<p>На сегодняшний день Альфа-банк расширил программы ипотечного кредитования, и теперь у клиентов есть новые возможности:</p>
<ul>
<li>передавать в залог аренду прав на земельный участок и уступку прав требований при долевом строительстве;</li>
<li>появилась возможность нецелевого ипотечного кредитования и ипотечного кредитования под залог имеющейся недвижимости.</li>
</ul>
    HTML
  },
  {
    status: true, name: "Росбанк", anchor: "rosbank",
    description: <<-HTML
<p>Частный универсальный банк, оказывающий все виды услуг частным и корпоративным клиентам.</p>
<p>Росбанк обслуживает порядка 1,5 млн активных розничных клиентов, около 83 тыс. активных клиентов малого бизнеса и около 10 тыс. активных клиентов корпоративного бизнеса более чем в 60 регионах России. Сеть банка насчитывает более 220 отделений и 37 тыс. банкоматов партнерской сети, включая порядка 1500 собственных. Росбанк включен Банком России в перечень 13 системно значимых кредитных организаций. Банк имеет наивысшие кредитные рейтинги национальных рейтинговых агентств (АКРА, ААА (RU), «Эксперт РА», ruААА).</p>
<p>По итогам 2021 года входит в ТОП-3 среди частных банков по объему ипотечного портфеля и портфеля автокредитов. Лауреат премии CX World Awards 2021 за клиентоцентричную корпоративную культуру и инновации в клиентском опыте. Победитель премии Frank Mortgage Award 2021 в номинации «Самые лояльные клиенты». По итогам акции «Зеленый и здоровый офис – 2021» признан «Самой экологически открытой компанией».</p>
    HTML
  },
  {
    status: true, name: "Промсвязьбанк", anchor: "psb",
    description: <<-HTML
<p>Промсвязьбанк входит в топ-10 крупнейших банков России и является универсальным банком с государственным участием, чья история насчитывает уже более 20 лет. Признан Центральным Банком России одним из 11 системно значимых финансовых институтов.</p>
<p>Промсвязьбанк выбран в качестве опорного банка для реализации государственного оборонного заказа и сопровождения крупных государственных контрактов, оказывает полный спектр услуг розничным и корпоративным клиентам, малому и среднему бизнесу.</p>
    HTML
  }
]

partners.each do |partner_data|
  partner = Partner.find_or_create_by(partner_data)

  partner.logo.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/partners/#{partner.anchor}.png")),
    filename: "#{partner.anchor}.png"
  )

  puts "Партнер создан: #{partner.name}"
end

puts "Seeding Partners completed!\r\n\r\n"
# Partners End
