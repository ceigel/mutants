require 'rails_helper'

feature 'mutants list' do
  let!(:mutant) { FactoryGirl.create(:mutant)}
  let!(:team) { FactoryGirl.create(:team)}
  let!(:task) { FactoryGirl.create(:task, team: team)}
  before do
    team.mutants << mutant
  end

  context 'non admin' do
    before { login_as mutant }

    scenario do
      visit mutants_path

      expect(page).to have_content 'Mutants'
      expect(find('a[data-method=delete]')).to have_content('')

      within('#mutants_table') do
        expect(find('tbody>tr>td:first>a')).to have_content(mutant.name)
      end
    end

    scenario 'mutant profile' do
      visit mutant_path(mutant)

      expect(page).to have_content "Mutant name: #{mutant.name}"
      expect(page).to have_content "Teams"
      expect(page).to have_content "Tasks"
      expect(page).to have_content team.name
      expect(page).to have_content task.name
    end
  end

  context 'admin' do
    before do
      mutant.update(admin: true)
      login_as mutant
    end

    scenario do
      visit mutants_path

      expect(page).to have_content 'Mutants'
      within('#mutants_table') do
        expect(find('a[data-method=delete]')[:href]).to eq(mutant_path(mutant))
        expect(find("a[href='#{edit_mutant_path(mutant)}']")).to have_content('')
      end
    end

    scenario 'edit mutant' do
      visit mutants_path
      find("a[href='#{edit_mutant_path(mutant)}']").click
      fill_in 'Name', with: 'TestMutant'
      click_button 'Update Mutant'
      expect(page).to have_content 'testmutant'
    end
  end
end

