class Message < ApplicationRecord
  has_many_attached :images

  scope :unread, -> { where(status: "new") }

  STATUSES = {
    new: "Новый",
    viewed: "Просмотрен",
    at_work: "В работе",
    completed: "Завершен",
    rejected: "Отклонен"
  }

  CATEGORIES = {
    message: "Сообщение",
    response: "Отклик",
    response_mobile: "Отклик",
    review: "Отзыв",
    request: "Заявка"
  }

  PAGE_TITLES = {
    contacts: "из формы обратной связи (страница Контакты)",
    vacancies: "на вакасию",
    team_members: "из формы обратной связи для",
    review_team_members: "для сотрудника",
    rents_out: "на размещение недвижимости в аренду на сайте",
    rents: "на подбор недвижимости для клиента"
  }
end
