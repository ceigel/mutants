require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    @team = FactoryGirl.create(:team)
    assign(:task, Task.new(
      :name => "MyString",
      :team => @team
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", team_tasks_path(@team), "post" do

      assert_select "input#task_name[name=?]", "task[name]"

    end
  end
end
