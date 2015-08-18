require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  let!(:team) { FactoryGirl.create(:team) }
  let!(:mutant) { FactoryGirl.create(:mutant) }
  let!(:mutant2) { FactoryGirl.create(:mutant) }
  before do
    team.mutants << mutant
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {:team_id => team.to_param}
      expect(response).to have_http_status(:success)
    end

    it "assigns non members to @non_members" do
      get :edit, {:team_id => team.to_param}
      expect(assigns(:non_members)).to eq(Array(mutant2))
    end

    it "assigns team members to @members" do
      get :edit, {:team_id => team.to_param}
      expect(assigns(:members)).to eq(Array(mutant))
    end
  end

  describe "POST #create" do
    it "adds a new member" do
      expect {
        xhr :post, :create, {:team_id => team.to_param, id: mutant2.to_param}
      }.to change{ team.mutants.count }.by(1)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a member" do
      expect {
        xhr :delete, :destroy, {:team_id => team.to_param, id: mutant.to_param}
      }.to change{ team.mutants.count }.by(-1)
    end
  end
end
