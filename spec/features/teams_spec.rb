require 'rails_helper'

feature 'mutants list' do
  let(:mutant) { FactoryGirl.create(:mutant) }
  let!(:team) { FactoryGirl.create(:team)}
  let!(:task) { FactoryGirl.create(:task, team: team)}

  before do
    team.mutants << mutant
  end

  context 'non admin' do
    before { login_as mutant }

    scenario do
      visit teams_path

      expect(page).to have_content 'Teams'
      expect(find('a[data-method=delete]')).to have_content('')

      expect(find('table>tbody>tr>td>a')).to have_content(team.name)
    end

    scenario 'team info' do
      visit team_path(team)

      expect(page).to have_content "Team: #{team.name}"
      expect(page).to have_content "Tasks"
      expect(page).to have_content "Members"
      expect(page).to have_content mutant.name
      expect(page).to have_content task.name
    end
  end

  context 'admin' do
    before do
      mutant.update(admin: true)
      login_as mutant
    end

    scenario do
      visit teams_path

      expect(page).to have_content 'Teams'
      within('table') do
        expect(find('a[data-method=delete]')[:href]).to eq(team_path(team))
        expect(find("a[href='#{edit_team_path(team)}']")).to have_content('')
      end
    end
    scenario 'edit team' do
      visit teams_path
      find("a[href='#{edit_team_path(team)}']").click
      fill_in 'Name', with: 'TestTeam'
      click_button 'Update Team'
      expect(page).to have_content 'TestTeam'
    end

    scenario 'add task' do
      visit team_path(team)
      click_link('Add task')

      fill_in 'Name', with: 'workout'
      click_button 'Create Task'
      expect(page).to have_content 'Task was successfully created'
      within('#tasks_list') do
        expect(page).to have_content 'workout'
        expect(page).to have_content task.name
      end
    end
  end
end

