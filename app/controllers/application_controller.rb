class ApplicationController < ActionController::Base
  layout :layout
  add_breadcrumb "Главная", :root_path

  def index
    @partners = Partner.active.sort_by { |partner| partner.position }
    @team_members = TeamMember.active.sort_by { |team_member| team_member.position }
    @best_agent = TeamMember.active.find_by(best_agent: true)
    @best_agent_realties = @best_agent.realties.active.joins(:realty_category).where(realty_category: { slug: %w[buy rent] }).group_by(&:type_object).to_h.map { |_, values| values }.flatten

    realties = Realty.active.joins(:realty_category).where(realty_category: { slug: %w[buy rent] })
    total_entries = realties.size > 18 ? 18 : realties.size
    @realties = realties.paginate(page: params[:page], per_page: 6, total_entries: total_entries).order(created_at: :desc)
    @message = Message.new
  end

  private

  def layout
    devise_controller? && devise_mapping.name == :admin ? "admin" : "application"
  end
end
