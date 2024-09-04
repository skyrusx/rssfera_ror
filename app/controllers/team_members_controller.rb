class TeamMembersController < ApplicationController
  add_breadcrumb I18n.t("admin_breadcrumbs.team_members"), :team_members_path

  def index
    @contacts = Contact.last
    @social_links = SocialLink.active
    @team_members = TeamMember.active.sort_by { |street| street.position }
  end

  def show
  end
end
