require 'rails_helper'


RSpec.describe MutantsController, type: :controller do
  let!(:admin) { FactoryGirl.create(:mutant, :admin) }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:mutant)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:mutant, name: nil)
  }


  context 'admin user signed in' do
    before do
      sign_in admin
    end

    describe "GET #index" do
      it "assigns all mutants as @mutants" do
        mutant = Mutant.create! valid_attributes
        get :index, {}
        expect(assigns(:mutants)).to include(mutant)
      end
    end

    describe "GET #show" do
      it "assigns the requested mutant as @mutant" do
        mutant = Mutant.create! valid_attributes
        get :show, {:id => mutant.to_param}
        expect(assigns(:mutant)).to eq(mutant)
      end
    end

    describe "GET #edit" do
      it "assigns the requested mutant as @mutant" do
        mutant = Mutant.create! valid_attributes
        get :edit, {:id => mutant.to_param}
        expect(assigns(:mutant)).to eq(mutant)
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          FactoryGirl.attributes_for(:mutant, name: 'xavier')
        }

        it "updates the requested mutant" do
          mutant = Mutant.create! valid_attributes
          put :update, {:id => mutant.to_param, :mutant => new_attributes}
          mutant.reload
          expect(mutant.name).to eq('xavier')
        end

        it "assigns the requested mutant as @mutant" do
          mutant = Mutant.create! valid_attributes
          put :update, {:id => mutant.to_param, :mutant => valid_attributes}
          expect(assigns(:mutant)).to eq(mutant)
        end

        it "redirects to the mutant" do
          mutant = Mutant.create! valid_attributes
          put :update, {:id => mutant.to_param, :mutant => valid_attributes}
          expect(response).to redirect_to(mutant)
        end
      end

      context "with invalid params" do
        it "assigns the mutant as @mutant" do
          mutant = Mutant.create! valid_attributes
          put :update, {:id => mutant.to_param, :mutant => invalid_attributes}
          expect(assigns(:mutant)).to eq(mutant)
        end

        it "re-renders the 'edit' template" do
          mutant = Mutant.create! valid_attributes
          put :update, {:id => mutant.to_param, :mutant => invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested mutant" do
        mutant = Mutant.create! valid_attributes
        expect {
          delete :destroy, {:id => mutant.to_param}
        }.to change(Mutant, :count).by(-1)
      end

      it "redirects to the mutants list" do
        mutant = Mutant.create! valid_attributes
        delete :destroy, {:id => mutant.to_param}
        expect(response).to redirect_to(mutants_url)
      end
    end
  end

  context 'user not signed in' do
    describe "GET #index" do
      it "returns http redirect" do
        get :index, {}
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #show" do
      it "returns http redirect" do
        get :show, {:id => admin.to_param}
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #edit" do
      it "returns http redirect" do
        get :edit, {:id => admin.to_param}
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT #update" do
      it "returns http redirect" do
        put :update, {:id => admin.to_param, :mutant => valid_attributes}
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE #destroy" do
      it "returns http redirect" do
        delete :destroy, {:id => admin.to_param}
        expect(response).to have_http_status(302)
      end
    end
  end
end
