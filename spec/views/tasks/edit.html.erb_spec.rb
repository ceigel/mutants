require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @team = FactoryGirl.create(:team)
    @task = FactoryGirl.create(:task, name: "Task", team: @team)
  end

  it "renders the edit task form" do
    render
    assert_select "form[action=?][method=?]", team_task_path(@team, @task), "post" do

      assert_select "input#task_name[name=?]", "task[name]"
    end
  end
end
