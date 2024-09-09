namespace :add do
  desc "Заполнение позиции у сотрудников"
  task settings: :environment do
    puts "Начало"

    Setting::PAGES.each do |key, value|
      settings = Setting.find_by(page: key)
      next if settings.present?

      setting = Setting.new
      setting.page = key
      setting.page_name = value
      setting.save

      puts "Настройки для страницы #{setting.page_name} добавлены!"
    end

    puts "Завершено!"
  end
end
