require 'rails_helper'


feature 'sidebar' do
  let!(:mutant) { FactoryGirl.create(:mutant) }
  let!(:team) { FactoryGirl.create(:team) }

  context do
    before { login_as mutant }

    scenario 'when mutant is not a member of any team' do
      visit root_path

      within('#sidebar') do
        expect(page).to have_text("Teams")
        expect(page).to have_text("Tasks")
        expect(find('#tasks>ul')).to have_content('')
        expect(find('#teams>ul')).to have_content('')
      end
    end

    context 'when mutant is a member of a team' do
      before do
        team.mutants << mutant
      end

      scenario do
        visit root_path
        within('#sidebar') do
          expect(page).to have_text("Teams")
          expect(page).to have_text("Tasks")
          expect(find('#teams>ul')).to have_content(team.name)
          expect(find('#tasks>ul')).to have_content('')
        end
      end

      context 'with tasks' do
        before do
          @task = FactoryGirl.create(:task, team: team)
        end

        scenario do
          visit root_path
          within('#sidebar') do
            expect(page).to have_text("Teams")
            expect(page).to have_text("Tasks")
            expect(find('#teams>ul')).to have_content(team.name)
            expect(find('#tasks>ul')).to have_content(@task.name)
          end
        end
      end
    end
  end
end
