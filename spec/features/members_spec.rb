require 'rails_helper'

feature 'mutants list' do
  let!(:mutant) { FactoryGirl.create(:mutant) }
  let!(:mutant2) { FactoryGirl.create(:mutant, :admin) }
  let!(:team) { FactoryGirl.create(:team)}

  before do
    team.mutants << mutant
  end

  context 'non admin' do
    before { login_as mutant }

    scenario 'data present' do
      visit edit_team_members_path(team)

      expect(page).to have_content('Non members')
      expect(page).to have_content('Members')
      within("[data-type='non_members']") do
        expect(page).to have_content(mutant2.name)
        expect(first('tr:first>td>a')).to have_content('')
      end
      within("[data-type='members']") do
        expect(page).to have_content(mutant.name)
        expect(first('tr:first>td>a')).to have_content('')
      end
    end
  end

  context 'admin' do
    before { login_as mutant2 }
    scenario 'data present' do
      visit edit_team_members_path(team)

      expect(page).to have_content('Non members')
      expect(page).to have_content('Members')
      within("[data-type='non_members']") do
        expect(page).to have_content(mutant2.name)
      end
      within("[data-type='members']") do
        expect(page).to have_content(mutant.name)
      end
    end
  end
end

