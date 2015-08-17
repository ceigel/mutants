class MembersController < ApplicationController
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
    respond_with(@team)
  end

  def destroy
    @member = Mutant.find(params[:id])
    @team.mutants.destroy(@member)
    @table_to_add = 'non_members'
    respond_with(@team)
  end

  private
    def set_team
      @team = Team.find(params[:team_id])
    end
end
