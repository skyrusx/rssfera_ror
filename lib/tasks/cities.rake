namespace :add do
  desc "Импорт объектов недвижимости"
  task cities: :environment do
    puts "Начало"

    OBJECTS = {
      "Мурманская область" => [
        {
          name: "Мурманск", type: "город", type_short: "г.",
          districts: [
            {
              name: "Ленинский", type: "район", type_short: "р-н",
              streets: [
                { name: "Героев-cевероморцев", type: "проспект", type_short: "пр-кт" },
                { name: "Адмирала флота Лобова", type: "улица", type_short: "ул." },
                { name: "Александра Невского", type: "улица", type_short: "ул." },
                { name: "Александра Торцева", type: "улица", type_short: "ул." },
                { name: "Александрова", type: "улица", type_short: "ул." },
                { name: "Алексея Позднякова", type: "улица", type_short: "ул." },
                { name: "Алексея Хлобыстова", type: "улица", type_short: "ул." },
                { name: "Анатолия Бредова", type: "улица", type_short: "ул." },
                { name: "Аскольдовцев", type: "улица", type_short: "ул." },
                { name: "Береговая", type: "улица", type_short: "ул." },
                { name: "Большая Ручьевая", type: "улица", type_short: "ул." },
                { name: "Боровая", type: "улица", type_short: "ул." },
                { name: "Бредова", type: "улица", type_short: "ул." },
                { name: "Володарского", type: "улица", type_short: "ул." },
                { name: "Виктора Миронова", type: "улица", type_short: "ул." },
                { name: "Вице-адмирала Николаева", type: "улица", type_short: "ул." },
                { name: "Гончарова", type: "улица", type_short: "ул." },
                { name: "Домостроительная", type: "улица", type_short: "ул." },
                { name: "Заводская", type: "улица", type_short: "ул." },
                { name: "Загородная", type: "улица", type_short: "ул." },
                { name: "Зеленая", type: "улица", type_short: "ул." },
                { name: "Ивана Сивко", type: "улица", type_short: "ул." },
                { name: "Инженерная", type: "улица", type_short: "ул." },
                { name: "Калинина", type: "улица", type_short: "ул." },
                { name: "Карла Либкнехта", type: "улица", type_short: "ул." },
                { name: "Кирпичная", type: "улица", type_short: "ул." },
                { name: "Коминтерна", type: "улица", type_short: "ул." },
                { name: "Лесная", type: "улица", type_short: "ул." },
                { name: "Лодыгина", type: "улица", type_short: "ул." },
                { name: "Магомета Гаджиева", type: "улица", type_short: "ул." },
                { name: "Малая Ручьевая", type: "улица", type_short: "ул." },
                { name: "Матросская", type: "улица", type_short: "ул." },
                { name: "Маяковского", type: "улица", type_short: "ул." },
                { name: "Молодежная", type: "улица", type_short: "ул." },
                { name: "Мохнаткина Пахта", type: "улица", type_short: "ул." },
                { name: "Мурманская", type: "улица", type_short: "ул." },
                { name: "Набережная", type: "улица", type_short: "ул." },
                { name: "Нахимова", type: "улица", type_short: "ул." },
                { name: "Нижняя Роста", type: "улица", type_short: "ул." },
                { name: "Октябрьская", type: "улица", type_short: "ул." },
                { name: "Оленегорская", type: "улица", type_short: "ул." },
                { name: "Павлика Морозова", type: "улица", type_short: "ул." },
                { name: "Пищевиков", type: "улица", type_short: "ул." },
                { name: "Подстаницкого", type: "улица", type_short: "ул." },
                { name: "Полины Осипенко", type: "улица", type_short: "ул." },
                { name: "Привокзальная", type: "улица", type_short: "ул." },
                { name: "Приморская", type: "улица", type_short: "ул." },
                { name: "Промышленная", type: "улица", type_short: "ул." },
                { name: "Ростинская", type: "улица", type_short: "ул." },
                { name: "Садовая", type: "улица", type_short: "ул." },
                { name: "Сафонова", type: "улица", type_short: "ул." },
                { name: "Саши Ковалева", type: "улица", type_short: "ул." },
                { name: "Свердлова", type: "улица", type_short: "ул." },
                { name: "Семена Дежнева", type: "улица", type_short: "ул." },
                { name: "Советская", type: "улица", type_short: "ул." },
                { name: "Транспортная", type: "улица", type_short: "ул." },
                { name: "Туристов", type: "улица", type_short: "ул." },
                { name: "Угольная База", type: "улица", type_short: "ул." },
                { name: "Урицкого", type: "улица", type_short: "ул." },
                { name: "Успенского", type: "улица", type_short: "ул." },
                { name: "Ушакова", type: "улица", type_short: "ул." },
                { name: "Челюскинцев", type: "улица", type_short: "ул." },
                { name: "Чумбарова-Лучинского", type: "улица", type_short: "ул." },
                { name: "Шестой Комсомольской батареи", type: "улица", type_short: "ул." },
                { name: "Школьная", type: "улица", type_short: "ул." },
                { name: "Юрия Гагарина", type: "улица", type_short: "ул." },
                { name: "Арктический", type: "переулок", type_short: "пер." },
                { name: "Водопроводный", type: "переулок", type_short: "пер." },
                { name: "Разина", type: "переулок", type_short: "пер." },
                { name: "Репина", type: "переулок", type_short: "пер." },
                { name: "Терский", type: "переулок", type_short: "пер." },
                { name: "Брянский", type: "проезд", type_short: "пр-д" },
                { name: "Владимира Капустина", type: "проезд", type_short: "пр-д" },
                { name: "Ивана Халатина", type: "проезд", type_short: "пр-д" },
                { name: "Металлистов", type: "проезд", type_short: "пр-д" },
                { name: "Михаила Ивченко", type: "проезд", type_short: "пр-д" },
                { name: "Портовый", type: "проезд", type_short: "пр-д" },
                { name: "Профессора Жуковского", type: "проезд", type_short: "пр-д" },
                { name: "Речной", type: "проезд", type_short: "пр-д" },
                { name: "Нижне-Ростинское", type: "шоссе", type_short: "ш." },
                { name: "Верхне-Ростинское", type: "шоссе", type_short: "ш." },
                { name: "Североморское", type: "шоссе", type_short: "ш." }
              ]
            },
            {
              name: "Октябрьский", type: "район", type_short: "р-н",
              streets: [
                { name: "Кирова", type: "проспект", type_short: "пр-кт" },
                { name: "Кольский", type: "проспект", type_short: "пр-кт" },
                { name: "Ленина", type: "проспект", type_short: "пр-кт" },
                { name: "Академика Книповича", type: "улица", type_short: "ул." },
                { name: "Академика Павлова", type: "улица", type_short: "ул." },
                { name: "Володарского", type: "улица", type_short: "ул." },
                { name: "Воровского", type: "улица", type_short: "ул." },
                { name: "Гвардейская", type: "улица", type_short: "ул." },
                { name: "Генерала Журбы", type: "улица", type_short: "ул." },
                { name: "Генерала Фролова", type: "улица", type_short: "ул." },
                { name: "Георгия Седова", type: "улица", type_short: "ул." },
                { name: "Гоголя", type: "улица", type_short: "ул." },
                { name: "Дзержинского", type: "улица", type_short: "ул." },
                { name: "Заводская", type: "улица", type_short: "ул." },
                { name: "Капитана Буркова", type: "улица", type_short: "ул." },
                { name: "Капитана Егорова", type: "улица", type_short: "ул." },
                { name: "Капитана Маклакова", type: "улица", type_short: "ул." },
                { name: "Капитана Пономарева", type: "улица", type_short: "ул." },
                { name: "Карла Либкнехта", type: "улица", type_short: "ул." },
                { name: "Карла Маркса", type: "улица", type_short: "ул." },
                { name: "Кильдинская", type: "улица", type_short: "ул." },
                { name: "Коминтерна", type: "улица", type_short: "ул." },
                { name: "Коммуны", type: "улица", type_short: "ул." },
                { name: "Комсомольская", type: "улица", type_short: "ул." },
                { name: "Куйбышева", type: "улица", type_short: "ул." },
                { name: "Ленинградская", type: "улица", type_short: "ул." },
                { name: "Марата", type: "улица", type_short: "ул." },
                { name: "Мира", type: "улица", type_short: "ул." },
                { name: "Новое Плато", type: "улица", type_short: "ул." },
                { name: "Октябрьская", type: "улица", type_short: "ул." },
                { name: "Папанина", type: "улица", type_short: "ул." },
                { name: "Пархоменко", type: "улица", type_short: "ул." },
                { name: "Планерная", type: "улица", type_short: "ул." },
                { name: "Полухина", type: "улица", type_short: "ул." },
                { name: "Полярной Дивизии", type: "улица", type_short: "ул." },
                { name: "Полярной Правды", type: "улица", type_short: "ул." },
                { name: "Полярные Зори", type: "улица", type_short: "ул." },
                { name: "Профессора Сомова", type: "улица", type_short: "ул." },
                { name: "Профсоюзов", type: "улица", type_short: "ул." },
                { name: "Самойловой", type: "улица", type_short: "ул." },
                { name: "Серафимовича", type: "улица", type_short: "ул." },
                { name: "Скальная", type: "улица", type_short: "ул." },
                { name: "Софьи Перовской", type: "улица", type_short: "ул." },
                { name: "Сполохи", type: "улица", type_short: "ул." },
                { name: "Старостина", type: "улица", type_short: "ул." },
                { name: "Пушкинская", type: "улица", type_short: "ул." },
                { name: "Радищева", type: "улица", type_short: "ул." },
                { name: "Рогозерская", type: "улица", type_short: "ул." },
                { name: "Трудовых Резервов", type: "улица", type_short: "ул." },
                { name: "Фурманова", type: "улица", type_short: "ул." },
                { name: "Чапаева", type: "улица", type_short: "ул." },
                { name: "Челюскинцев", type: "улица", type_short: "ул." },
                { name: "Чехова", type: "улица", type_short: "ул." },
                { name: "Шмидта", type: "улица", type_short: "ул." },
                { name: "Шолохова", type: "улица", type_short: "ул." },
                { name: "Дальний", type: "переулок", type_short: "пер." },
                { name: "Русанова", type: "переулок", type_short: "пер." },
                { name: "Театральный", type: "бульвар", type_short: "б-р" },
                { name: "Капитана Тарана", type: "проезд", type_short: "пр-д" },
                { name: "Рыбный", type: "проезд", type_short: "пр-д" },
                { name: "Рылеева", type: "проезд", type_short: "пр-д" },
                { name: "Связи", type: "проезд", type_short: "пр-д" },
                { name: "Северный", type: "проезд", type_short: "пр-д" },
                { name: "Сосновый", type: "проезд", type_short: "пр-д" },
                { name: "Флотский", type: "проезд", type_short: "пр-д" },
                { name: "Верхне-Ростинское", type: "шоссе", type_short: "ш." }
              ]
            },
            {
              name: "Первомайский", type: "район", type_short: "р-н",
              streets: [
                { name: "Кирова", type: "проспект", type_short: "пр-кт" },
                { name: "Кольский", type: "проспект", type_short: "пр-кт" },
                { name: "Алексея Генералова", type: "улица", type_short: "ул." },
                { name: "Баумана", type: "улица", type_short: "ул." },
                { name: "Беринга", type: "улица", type_short: "ул." },
                { name: "Бондарная", type: "улица", type_short: "ул." },
                { name: "Бочкова", type: "улица", type_short: "ул." },
                { name: "Владимирская", type: "улица", type_short: "ул." },
                { name: "Гарнизонная", type: "улица", type_short: "ул." },
                { name: "Героев Рыбачьего", type: "улица", type_short: "ул." },
                { name: "Генерала Щербакова", type: "улица", type_short: "ул." },
                { name: "Горького", type: "улица", type_short: "ул." },
                { name: "Декабристов", type: "улица", type_short: "ул." },
                { name: "Достоевского", type: "улица", type_short: "ул." },
                { name: "Заречная", type: "улица", type_short: "ул." },
                { name: "Зелёная", type: "улица", type_short: "ул." },
                { name: "Зои Космодемьянской", type: "улица", type_short: "ул." },
                { name: "Каменная", type: "улица", type_short: "ул." },
                { name: "Колхозная", type: "улица", type_short: "ул." },
                { name: "Кооперативная", type: "улица", type_short: "ул." },
                { name: "Капитана Копытова", type: "улица", type_short: "ул." },
                { name: "Капитана Орликовой", type: "улица", type_short: "ул." },
                { name: "Капитана Пономарёва", type: "улица", type_short: "ул." },
                { name: "Котовского", type: "улица", type_short: "ул." },
                { name: "Крупской", type: "улица", type_short: "ул." },
                { name: "Лесная", type: "улица", type_short: "ул." },
                { name: "Ломоносова", type: "улица", type_short: "ул." },
                { name: "Марата", type: "улица", type_short: "ул." },
                { name: "Морская", type: "улица", type_short: "ул." },
                { name: "Новосельская", type: "улица", type_short: "ул." },
                { name: "Огни Мурманска", type: "улица", type_short: "ул." },
                { name: "Олега Кошевого", type: "улица", type_short: "ул." },
                { name: "Первомайская", type: "улица", type_short: "ул." },
                { name: "Песочная", type: "улица", type_short: "ул." },
                { name: "Печенгская", type: "улица", type_short: "ул." },
                { name: "Подгорная", type: "улица", type_short: "ул." },
                { name: "Полевая", type: "улица", type_short: "ул." },
                { name: "Полярный круг", type: "улица", type_short: "ул." },
                { name: "Прибрежная", type: "улица", type_short: "ул." },
                { name: "Пригородная", type: "улица", type_short: "ул." },
                { name: "Советская", type: "улица", type_short: "ул." },
                { name: "Спартака", type: "улица", type_short: "ул." },
                { name: "Спортивная", type: "улица", type_short: "ул." },
                { name: "Судоремонтная", type: "улица", type_short: "ул." },
                { name: "Траловая", type: "улица", type_short: "ул." },
                { name: "Три ручья", type: "улица", type_short: "ул." },
                { name: "Фадеев ручей", type: "улица", type_short: "ул." },
                { name: "Фестивальная", type: "улица", type_short: "ул." },
                { name: "Фрунзе", type: "улица", type_short: "ул." },
                { name: "Халтурина", type: "улица", type_short: "ул." },
                { name: "Шабалина", type: "улица", type_short: "ул." },
                { name: "Шевченко", type: "улица", type_short: "ул." },
                { name: "Шмидта", type: "улица", type_short: "ул." },
                { name: "Южная", type: "улица", type_short: "ул." },
                { name: "Юрия Смирнова", type: "улица", type_short: "ул." },
                { name: "Дорожный", type: "переулок", type_short: "пер." },
                { name: "Охотничий", type: "переулок", type_short: "пер." },
                { name: "Ручьевой", type: "переулок", type_short: "пер." },
                { name: "Хибинский", type: "переулок", type_short: "пер." },
                { name: "Якорный", type: "переулок", type_short: "пер." },
                { name: "Автопарковый", type: "проезд", type_short: "пр-д" },
                { name: "Кольцевой" , type: "проезд", type_short: "пр-д"},
                { name: "Ледокольный", type: "проезд", type_short: "пр-д" },
                { name: "Лыжный", type: "проезд", type_short: "пр-д" },
                { name: "Михаила Бабикова", type: "проезд", type_short: "пр-д" },
                { name: "Молодёжный", type: "проезд", type_short: "пр-д" },
                { name: "Снежный", type: "проезд", type_short: "пр-д" }
              ]
            }
          ],
        },
        {
          name: "Умба", type: "посёлок городского типа", type_short: "пгт.",
          districts: [
            {
              name: "Терский", type: "район", type_short: "р-н",
              streets: [
                { name: "8 Марта", type: "улица", type_short: "ул." },
                { name: "Беломорская", type: "улица", type_short: "ул." },
                { name: "Восточная", type: "улица", type_short: "ул." },
                { name: "Горная", type: "улица", type_short: "ул." },
                { name: "Дзержинского", type: "улица", type_short: "ул." },
                { name: "Зеленая", type: "улица", type_short: "ул." },
                { name: "Кирова", type: "улица", type_short: "ул." },
                { name: "Ключевая", type: "улица", type_short: "ул." },
                { name: "Комсомольская", type: "улица", type_short: "ул." },
                { name: "Луговая", type: "улица", type_short: "ул." },
                { name: "Морская", type: "улица", type_short: "ул." },
                { name: "Набережная", type: "улица", type_short: "ул." },
                { name: "Новая", type: "улица", type_short: "ул." },
                { name: "Озерная", type: "улица", type_short: "ул." },
                { name: "Октябрьская", type: "улица", type_short: "ул." },
                { name: "Пионерская", type: "улица", type_short: "ул." },
                { name: "Победы", type: "улица", type_short: "ул." },
                { name: "Приморская", type: "улица", type_short: "ул." },
                { name: "Рабочая", type: "улица", type_short: "ул." },
                { name: "Рыбников", type: "улица", type_short: "ул." },
                { name: "Рыбоводная", type: "улица", type_short: "ул." },
                { name: "Северная", type: "улица", type_short: "ул." },
                { name: "Советская", type: "улица", type_short: "ул." },
                { name: "Совхозная", type: "улица", type_short: "ул." },
                { name: "Спортивная", type: "улица", type_short: "ул." },
                { name: "Строительная", type: "улица", type_short: "ул." },
                { name: "Ударников", type: "улица", type_short: "ул." },
                { name: "Умбская", type: "улица", type_short: "ул." },
                { name: "1-й Кирпичный", type: "переулок", type_short: "пер." },
                { name: "2-й Кирпичный", type: "переулок", type_short: "пер." },
                { name: "Восточный", type: "переулок", type_short: "пер." },
                { name: "Лесной", type: "переулок", type_short: "пер." },
                { name: "Полярный", type: "переулок", type_short: "пер." },
                { name: "Южный", type: "переулок", type_short: "пер." },
                { name: "Октябрьская", type: "площадь", type_short: "пл." }
              ]
            }
          ]
        },
        {
          city: "Мурмаши", type: "посёлок городского типа", type_short: "пгт.",
          districts: [
            {
              name: "Кольский", type: "район", type_short: "р-н",
              streets: [
                { name: "Аэропорт", type: "улица", type_short: "ул." },
                { name: "Большой Кротов ручей", type: "улица", type_short: "ул." },
                { name: "Гвардейская", type: "улица", type_short: "ул." },
                { name: "Зеленая", type: "улица", type_short: "ул." },
                { name: "Зеленый городок", type: "улица", type_short: "ул." },
                { name: "Кайкова", type: "улица", type_short: "ул." },
                { name: "Кирова", type: "улица", type_short: "ул." },
                { name: "Комсомольская", type: "улица", type_short: "ул." },
                { name: "Кутахова", type: "улица", type_short: "ул." },
                { name: "Лесная", type: "улица", type_short: "ул." },
                { name: "Малый Кротов ручей", type: "улица", type_short: "ул." },
                { name: "Мира", type: "улица", type_short: "ул." },
                { name: "Мисякова", type: "улица", type_short: "ул." },
                { name: "Молодежная", type: "улица", type_short: "ул." },
                { name: "Московская", type: "улица", type_short: "ул." },
                { name: "Новая", type: "улица", type_short: "ул." },
                { name: "Овчинникова", type: "улица", type_short: "ул." },
                { name: "Октябрьская", type: "улица", type_short: "ул." },
                { name: "Пионерская", type: "улица", type_short: "ул." },
                { name: "Позднякова", type: "улица", type_short: "ул." },
                { name: "Полярная", type: "улица", type_short: "ул." },
                { name: "Причальная" , type: "улица", type_short: "ул."},
                { name: "Советская", type: "улица", type_short: "ул." },
                { name: "Торговая", type: "улица", type_short: "ул." },
                { name: "Тягунова", type: "улица", type_short: "ул." },
                { name: "Цесарского", type: "улица", type_short: "ул." },
                { name: "Энергетиков", type: "улица", type_short: "ул." },
                { name: "Комсомольский", type: "переулок", type_short: "пер." },
                { name: "Южный", type: "переулок", type_short: "пер." },
                { name: "Кирова", type: "площадь", type_short: "пл." },
                { name: "Туломское", type: "шоссе", type_short: "ш." }
              ]
            }
          ]
        },
        {
          name: "Кола", type: "город", type_short: "г.",
          districts: [
            {
              name: "Кольский", type: "район", type_short: "р-н",
              streets: [
                { name: "Защитников Заполярья", type: "проспект", type_short: "пр-кт" },
                { name: "Миронова", type: "проспект", type_short: "пр-кт" },
                { name: "Советский", type: "проспект", type_short: "пр-кт" },
                { name: "Андрусенко", type: "улица", type_short: "ул." },
                { name: "Дорожная", type: "улица", type_short: "ул." },
                { name: "Заводская", type: "улица", type_short: "ул." },
                { name: "Зеленая Набережная", type: "улица", type_short: "ул." },
                { name: "Каменный Остров", type: "улица", type_short: "ул." },
                { name: "Комсомольская", type: "улица", type_short: "ул." },
                { name: "Красноармейская", type: "улица", type_short: "ул." },
                { name: "Кривошеева", type: "улица", type_short: "ул." },
                { name: "Лесная", type: "улица", type_short: "ул." },
                { name: "Молодёжная", type: "улица", type_short: "ул." },
                { name: "Нагорная", type: "улица", type_short: "ул." },
                { name: "Новая", type: "улица", type_short: "ул." },
                { name: "Победы", type: "улица", type_short: "ул." },
                { name: "Поморская", type: "улица", type_short: "ул." },
                { name: "Привокзальная", type: "улица", type_short: "ул." },
                { name: "Приморская", type: "улица", type_short: "ул." },
                { name: "Северная", type: "улица", type_short: "ул." },
                { name: "Строительная", type: "улица", type_short: "ул." },
                { name: "Южная", type: "улица", type_short: "ул." },
                { name: "Островский", type: "переулок", type_short: "пер." },
                { name: "Автомобилистов", type: "проезд", type_short: "пр-д" },
                { name: "Кильдинское", type: "шоссе", type_short: "ш." }
              ]
            }
          ]
        },
        {
          name: "Кильдинстрой", type: "посёлок городского типа", type_short: "пгт.",
          districts: [
            {
              name: "Кольский", type: "район", type_short: "р-н",
              streets: [
                { name: "Набережная", type: "улица", type_short: "ул." },
                { name: "Полярная", type: "улица", type_short: "ул." },
                { name: "Советская", type: "улица", type_short: "ул." },
                { name: "Кильдинское", type: "шоссе", type_short: "ш." },
                { name: "Железнодорожный", type: "тупик", type_short: "туп." }
              ]
            }
          ]
        },
        {
          name: "Териберка", type: "село", type_short: "с.",
          districts: [
            {
              name: "Кольский", type: "район", type_short: "р-н",
              streets: [
                { name: "1 Пятилетка", type: "улица", type_short: "ул." },
                { name: "2 Пятилетка", type: "улица", type_short: "ул." },
                { name: "Зеленая", type: "улица", type_short: "ул." },
                { name: "Комсомольская", type: "улица", type_short: "ул." },
                { name: "Кооперативная", type: "улица", type_short: "ул." },
                { name: "Мурманская", type: "улица", type_short: "ул." },
                { name: "Набережная", type: "улица", type_short: "ул." },
                { name: "Пионерская", type: "улица", type_short: "ул." },
                { name: "Приморская", type: "улица", type_short: "ул." },
                { name: "Центральная", type: "улица", type_short: "ул." },
                { name: "Школьная", type: "улица", type_short: "ул." }
              ]
            }
          ]
        },
        {
          name: "Мурмаши", type: "посёлок городского типа", type_short: "пгт.",
          districts: [
            {
              name: "Кольский", type: "район", type_short: "р-н",
              streets: [
                { name: "Зеленая", type: "улица", type_short: "ул." },
                { name: "Кайкова", type: "улица", type_short: "ул." },
                { name: "Кирова", type: "улица", type_short: "ул." },
                { name: "Комсомольская", type: "улица", type_short: "ул." },
                { name: "Кутахова", type: "улица", type_short: "ул." },
                { name: "Мира", type: "улица", type_short: "ул." },
                { name: "Мисякова", type: "улица", type_short: "ул." },
                { name: "Молодежная", type: "улица", type_short: "ул." },
                { name: "Московская", type: "улица", type_short: "ул." },
                { name: "Овчинникова", type: "улица", type_short: "ул." },
                { name: "Позднякова", type: "улица", type_short: "ул." },
                { name: "Полярная", type: "улица", type_short: "ул." },
                { name: "Причальная", type: "улица", type_short: "ул." },
                { name: "Советская", type: "улица", type_short: "ул." },
                { name: "Тягунова", type: "улица", type_short: "ул." },
                { name: "Цесарского", type: "улица", type_short: "ул." },
                { name: "Энергетиков", type: "улица", type_short: "ул." },
                { name: "Зеленый", type: "городок", type_short: "г-к" },
              ]
            }
          ]
        },
        {
          name: "Молочный", type: "посёлок городского типа", type_short: "пгт.",
          districts: [
            {
              name: "Кольский", type: "район", type_short: "р-н",
              streets: [
                { name: "Заречная", type: "улица", type_short: "ул." },
                { name: "Молодежная", type: "улица", type_short: "ул." },
                { name: "Северная", type: "улица", type_short: "ул." },
                { name: "Совхозная", type: "улица", type_short: "ул." },
                { name: "Строителей", type: "улица", type_short: "ул." },
                { name: "Торговая", type: "улица", type_short: "ул." },
                { name: "Гальченко", type: "улица", type_short: "ул." },
                { name: "Рыбников", type: "улица", type_short: "ул." },
                { name: "Набережная", type: "улица", type_short: "ул." },
              ]
            }
          ]
        },
      ],
      "Ленинградская область" => [
        {
          name: "Шушары", type: "посёлок", type_short: "п.",
          districts: [
            {
              name: "Пушкинский", type: "район", type_short: "р-н",
              streets: [
                { name: "Автозаводская", type: "улица", type_short: "ул." },
                { name: "Батецкая", type: "улица", type_short: "ул." },
                { name: "Валдайская", type: "улица", type_short: "ул." },
                { name: "Василия Зверева", type: "улица", type_short: "ул." },
                { name: "Вишерская", type: "улица", type_short: "ул." },
                { name: "Железнодорожная", type: "улица", type_short: "ул." },
                { name: "Кузовная", type: "улица", type_short: "ул." },
                { name: "Ленина", type: "улица", type_short: "ул." },
                { name: "Мира", type: "улица", type_short: "ул." },
                { name: "Нины Петровой", type: "улица", type_short: "ул." },
                { name: "Окуловская", type: "улица", type_short: "ул." },
                { name: "Первомайская", type: "улица", type_short: "ул." },
                { name: "Поселковая", type: "улица", type_short: "ул." },
                { name: "Пролетраская", type: "улица", type_short: "ул." },
                { name: "Пушкинская", type: "улица", type_short: "ул." },
                { name: "Синдинская", type: "улица", type_short: "ул." },
                { name: "Софийская", type: "улица", type_short: "ул." },
                { name: "Чудовская", type: "улица", type_short: "ул." },
                { name: "Школьная", type: "улица", type_short: "ул." },
                { name: "1-й Бадаевский", type: "проезд", type_short: "пр-д" },
                { name: "2-й Бадаевский", type: "проезд", type_short: "пр-д" },
                { name: "3-й Бадаевский", type: "проезд", type_short: "пр-д" },
                { name: "Автозаводский", type: "проезд", type_short: "пр-д" },
                { name: "Крановый", type: "проезд", type_short: "пр-д" },
                { name: "Курьерский", type: "проезд", type_short: "пр-д" },
                { name: "Механический", type: "проезд", type_short: "пр-д" },
                { name: "Николаевский", type: "проезд", type_short: "пр-д" },
                { name: "Радиаторный", type: "проезд", type_short: "пр-д" },
                { name: "Экспедиторский", type: "проезд", type_short: "пр-д" },
                { name: "Волхонское", type: "шоссе", type_short: "ш." },
                { name: "Колпинское", type: "шоссе", type_short: "ш." },
                { name: "Московское", type: "шоссе", type_short: "ш." },
                { name: "Петербургское", type: "шоссе", type_short: "ш." },
                { name: "Усть-Ижорское", type: "шоссе", type_short: "ш." },
                { name: "Усть-Славянское", type: "шоссе", type_short: "ш." },
                { name: "Ям-Ижорское", type: "шоссе", type_short: "ш." },
                { name: "Ленсоветовская", type: "дорога", type_short: "дор." },
                { name: "Паровозная", type: "дорога", type_short: "дор." },
                { name: "Рубежная", type: "дорога", type_short: "дор." },
                { name: "Шушарская", type: "дорога", type_short: "дор." },
                { name: "Вилеровский", type: "переулок", type_short: "пер." },
                { name: "Молочный", type: "переулок", type_short: "пер." },
                { name: "Фронтовой", type: "переулок", type_short: "пер." },
                { name: "Витебский", type: "проспект", type_short: "пр-кт" },
                { name: "Новгородский", type: "проспект", type_short: "пр-кт" },
                { name: "Старорусский", type: "проспект", type_short: "пр-кт" },
                { name: "Ивана Шинкарёва", type: "сквер", type_short: "сквер" },
                { name: "Николая Ивасюка", type: "сквер", type_short: "сквер" },
              ]
            }
          ]
        }
      ]
    }

    OBJECTS.each do |region_name, objects|
      region = Region.find_by(full_name: region_name)

      objects.each do |object|
        full_name = [object[:name], object[:type]].join(" ")

        city_params = {
          name: object[:name],
          status: true,
          localized_name: object[:type],
          localized_name_short: object[:type_short],
          full_name: full_name,
          region_id: region.id
        }

        city = City.find_by(name: object[:name], region_id: region.id)
        unless city
          city = City.create(city_params)
          puts "Территориальный объект '#{city.full_name}' добавлен"
        end

        object[:districts].each do |district_data|
          district_full_name = [district_data[:name], district_data[:type]].join(" ")

          district_params = {
            name: district_data[:name],
            localized_name: district_data[:type],
            localized_name_short: district_data[:type_short],
            full_name: district_full_name,
            city_id: city.id
          }

          district = District.find_by(name: district_data[:name], city_id: city.id)
          unless district
            district = District.create(district_params)
            puts "Район '#{district.full_name}' добавлен"
          end

          district_data[:streets].each do |street_data|
            street_full_name = [street_data[:name], street_data[:type]].join(" ")

            street_params = {
              name: street_data[:name],
              localized_name: street_data[:type],
              localized_name_short: street_data[:type_short],
              full_name: street_full_name,
              district_id: district.id
            }

            street = Street.find_by(name: district_data[:name], district_id: district.id)
            unless street
              street = Street.create(street_params)
              puts "Территориальный адрес '#{street.full_name}' добавлен"
            end
          end
        end
      end
    end
    cities = {}

    puts "Завершено!"
  end
end
