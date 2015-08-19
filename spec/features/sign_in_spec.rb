require 'rails_helper'

feature 'mutant signup and login' do
  context "when mutant not signed-up" do
    let(:mutant_params) { FactoryGirl.attributes_for(:mutant) }

    scenario 'when mutant not signed-up' do
      visit new_mutant_registration_path

      fill_in "Name", with: mutant_params[:name]
      fill_in "mutant[password]", with: mutant_params[:password]
      fill_in "Password confirmation", with: mutant_params[:password]
      click_button "Sign up"

      expect(page).to have_text(mutant_params[:name].downcase)
    end
  end

  context "when mutant signed-up" do
    before do
      @mutant = FactoryGirl.create(:mutant)
      login_as @mutant, scope: :mutant
    end

    subject { page }

    scenario 'mutant settings' do
      visit root_path

      within('header') do
        expect(page).to have_text("Home")
        expect(page).to have_text("Mutants")
        expect(page).to have_text("Teams")
        expect(page).to have_text("Logout")
        expect(page).to have_text("Edit account")
        expect(page).to have_text(@mutant.name.downcase)
      end

    end
  end
end
