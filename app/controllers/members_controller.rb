class MembersController < ApplicationController
  include MembersHelper
  include ApplicationHelper
  include ActionView::Helpers::UrlHelper

  before_action :set_team
  respond_to :html, :js

  def edit
    @members = @team.mutants
    @non_members = Mutant.all - @members
  end

  def create
    @member = Mutant.find(params[:id])
    @team.mutants << @member
    @table_to_add = 'members'
    @link_creator =  create_remove_links(@team)
  end

  def destroy
    @member = Mutant.find(params[:id])
    @team.mutants.destroy(@member)
    @table_to_add = 'non_members'
    @link_creator =  create_add_links(@team)
  end

  private
    def set_team
      @team = Team.find(params[:team_id])
    end
end
