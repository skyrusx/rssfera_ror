class TeamMember < ApplicationRecord
  has_many :team_member_job_title_joins
  has_many :job_titles, through: :team_member_job_title_joins, source: :job_title
  has_many :reviews
  has_many :vacancies
  has_many :realties
  has_one_attached :photo

  is_positionable start: 1

  after_create :fill_slug

  scope :active, -> { where(status: true) }

  def whole_name(separator: " ")
    [self.last_name, self.first_name, self.patronymic_name].join(separator)
  end

  private

  def fill_slug
    self.slug = Translit.convert(self.whole_name(separator: "-"), :english).downcase
  end
end
