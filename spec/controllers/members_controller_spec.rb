require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  let!(:team) { FactoryGirl.create(:team) }
  let!(:mutant) { FactoryGirl.create(:mutant) }
  let!(:admin) { FactoryGirl.create(:mutant, :admin) }

  before do
    team.mutants << mutant
  end

  context 'mutant signed in' do
    before do
      sign_in admin
    end
    describe "GET #edit" do
      it "returns http success" do
        get :edit, {:team_id => team.to_param}
        expect(response).to have_http_status(:success)
      end

      it "assigns non members to @non_members" do
        get :edit, {:team_id => team.to_param}
        expect(assigns(:non_members)).to eq(Array(admin))
      end

      it "assigns team members to @members" do
        get :edit, {:team_id => team.to_param}
        expect(assigns(:members)).to eq(Array(mutant))
      end
    end

    describe "POST #create" do
      it "adds a new member" do
        expect {
          xhr :post, :create, {:team_id => team.to_param, id: admin.to_param}
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

  context 'mutant not signed in' do
    describe "GET #edit" do
      it "returns http success" do
        get :edit, {:team_id => team.to_param}
        expect(response).to have_http_status(302)
      end
    end

    describe "POST #create" do
      it "returns http success" do
        xhr :post, :create, {:team_id => team.to_param, id: admin.to_param}
        expect(response).to have_http_status(401)
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        xhr :delete, :destroy, {:team_id => team.to_param, id: mutant.to_param}
        expect(response).to have_http_status(401)
      end
    end
  end
end
