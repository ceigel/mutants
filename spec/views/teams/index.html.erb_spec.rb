require 'rails_helper'
require 'support/current_user_stub'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :name => "Powerful"
      ),
      Team.create!(
        :name => "Beautiful"
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => "Powerful".to_s, :count => 1
    assert_select "tr>td", :text => "Beautiful".to_s, :count => 1
  end
end
