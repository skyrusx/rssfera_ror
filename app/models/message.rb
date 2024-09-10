class Message < ApplicationRecord
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
    review: "Отзыв"
  }

  PAGE_TITLES = {
    contacts: "из формы обратной связи (страница Контакты)"
  }
end
