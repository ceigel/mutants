module MembersHelper
  def create_add_links(team)
    lambda do |mutant|
      path = team_members_path(team_id: team.to_param, id: mutant.to_param)
      button_link('+', path, 'btn-success', remote: true, method: :post)
    end
  end

  def create_remove_links(team)
    lambda do |mutant|
      path = team_member_path(team_id: team.to_param, id: mutant.to_param)
      button_link('-', path, 'btn-danger', remote: true, method: :delete)
    end
  end
end
