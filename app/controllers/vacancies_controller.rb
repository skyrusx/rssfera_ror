class VacanciesController < ApplicationController
  include ApplicationHelper

  def index
    add_breadcrumb meta_data.page_name, :vacancies_path

    @vacancies = Vacancy.active
    @vacancy_data = { tabs: [], contents: {} }

    names = @vacancies.pluck(:name).map { |name| name.split.first }.uniq
    names.each do |name|
      @vacancy_data[:tabs] << { id: name.parameterize, name: name }
    end

    @vacancies.each do |vacancy|
      vacancy_name = vacancy.name.split.first
      next unless names.include?(vacancy_name)

      if @vacancy_data[:contents].key?(vacancy_name.parameterize)
        @vacancy_data[:contents][vacancy_name.parameterize] << vacancy
      else
        @vacancy_data[:contents][vacancy_name.parameterize] = [vacancy]
      end
    end
  end

  def show
    @vacancy = Vacancy.find_by_slug(params[:slug])
    @message = Message.new
    @job_titles = JobTitle.active.pluck(:name, :id)

    add_breadcrumb meta_data.page_name, :vacancies_path
    add_breadcrumb @vacancy.name, :vacancy_path
  end
end
