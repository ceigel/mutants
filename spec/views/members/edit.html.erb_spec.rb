require 'rails_helper'
require 'support/current_user_stub'

RSpec.describe "members/edit", type: :view do
  before do
    @team =  FactoryGirl.create(:team, :name => "MyString")
    @mutant1 = FactoryGirl.create(:mutant)
    @mutant2 = FactoryGirl.create(:mutant)

    assign(:members, Array(@mutant1))
    assign(:non_members, Array(@mutant2))

    sign_in @mutant1
  end

  it "renders the edit team form" do
    render

    assert_select "[data-type='non_members']>tr>td", :text => @mutant2.name
    assert_select "[data-type='members']>tr>td", :text => @mutant1.name
  end
end
