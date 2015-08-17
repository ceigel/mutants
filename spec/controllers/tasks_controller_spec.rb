require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:team) { FactoryGirl.create(:team) }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:task, team: team)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:task, name: nil, team: team)
  }

  describe "GET #new" do
    it "assigns a new task as @task" do
      get :new, {:team_id => team.to_param}
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :edit, {:id => task.to_param, :team_id => team.to_param}
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => valid_attributes, :team_id => team.to_param}
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => valid_attributes, :team_id => team.to_param}
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => valid_attributes, :team_id => team.to_param}
        expect(response).to redirect_to(team)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        post :create, {:task => invalid_attributes, :team_id => team.to_param}
        expect(assigns(:task)).to be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        post :create, {:task => invalid_attributes, :team_id => team.to_param}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:task, name: 'Clean your room')
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => new_attributes, :team_id => team.to_param}
        task.reload
        expect(task.name).to eq('Clean your room')
      end

      it "assigns the requested task as @task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => valid_attributes, :team_id => team.to_param}
        expect(assigns(:task)).to eq(task)
      end

      it "redirects to the task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => valid_attributes, :team_id => team.to_param}
        expect(response).to redirect_to(team)
      end
    end

    context "with invalid params" do
      it "assigns the task as @task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => invalid_attributes, :team_id => team.to_param}
        expect(assigns(:task)).to eq(task)
      end

      it "re-renders the 'edit' template" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => invalid_attributes, :team_id => team.to_param}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = team.tasks.create! valid_attributes
      expect {
        delete :destroy, {:id => task.to_param, :team_id => team.to_param}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the parent team" do
      task = team.tasks.create! valid_attributes
      delete :destroy, :id => task.to_param, :team_id => team.to_param
      expect(response).to redirect_to(team_url)
    end
  end
end
