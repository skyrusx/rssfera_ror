class TeamMembersController < ApplicationController
  include ApplicationHelper

  def index
    add_breadcrumb meta_data.page_name, :team_members_path

    @team_members = TeamMember.active.sort_by { |team_member| team_member.position }
  end

  def show
    @team_member = TeamMember.find_by_slug(params[:slug])

    @realties = @team_member.realties.active.joins(:realty_category).where(realty_category: { slug: %w[buy rent] }).group_by(&:type_object).to_h
    count_all_objects = @realties.map { |_, values| values.size }.sum
    content_objects = @realties.map { |_, values| values }.flatten
    @realty_data = {
      tabs: [{ id: "all", name: "Все объекты", count: count_all_objects }],
      contents: [{ id: "all", objects: content_objects }]
    }

    @realties.each do |type, objects|
      type = Realty::TYPES[type.to_i]
      @realty_data[:tabs] << { id: type.parameterize, name: type, count: objects.size }
      @realty_data[:contents] << { id: type.parameterize, objects: objects }
    end

    @reviews = @team_member.reviews.published
    @message = Message.new
    @review = Message.new

    add_breadcrumb meta_data.page_name, :team_members_path
    add_breadcrumb @team_member.whole_name, :team_member_path
  end
end
