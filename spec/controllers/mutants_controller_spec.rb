require 'rails_helper'


RSpec.describe MutantsController, type: :controller do
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:mutant)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:mutant, name: nil)
  }

  describe "GET #index" do
    it "assigns all mutants as @mutants" do
      mutant = Mutant.create! valid_attributes
      get :index, {}
      expect(assigns(:mutants)).to eq([mutant])
    end
  end

  describe "GET #show" do
    it "assigns the requested mutant as @mutant" do
      mutant = Mutant.create! valid_attributes
      get :show, {:id => mutant.to_param}
      expect(assigns(:mutant)).to eq(mutant)
    end
  end

  describe "GET #new" do
    it "assigns a new mutant as @mutant" do
      get :new, {}
      expect(assigns(:mutant)).to be_a_new(Mutant)
    end
  end

  describe "GET #edit" do
    it "assigns the requested mutant as @mutant" do
      mutant = Mutant.create! valid_attributes
      get :edit, {:id => mutant.to_param}
      expect(assigns(:mutant)).to eq(mutant)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Mutant" do
        expect {
          post :create, {:mutant => valid_attributes}
        }.to change(Mutant, :count).by(1)
      end

      it "assigns a newly created mutant as @mutant" do
        post :create, {:mutant => valid_attributes}
        expect(assigns(:mutant)).to be_a(Mutant)
        expect(assigns(:mutant)).to be_persisted
      end

      it "redirects to the created mutant" do
        post :create, {:mutant => valid_attributes}
        expect(response).to redirect_to(action: :index)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved mutant as @mutant" do
        post :create, {:mutant => invalid_attributes}
        expect(assigns(:mutant)).to be_a_new(Mutant)
      end

      it "re-renders the 'new' template" do
        post :create, {:mutant => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:mutant, name: 'Xavier')
      }

      it "updates the requested mutant" do
        mutant = Mutant.create! valid_attributes
        put :update, {:id => mutant.to_param, :mutant => new_attributes}
        mutant.reload
        expect(mutant.name).to eq('Xavier')
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
