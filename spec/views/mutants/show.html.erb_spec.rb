require 'rails_helper'
require 'support/current_user_stub'

RSpec.describe "mutants/show", type: :view do
  before(:each) do
    @mutant = assign(:mutant, FactoryGirl.create(:mutant, :name => "xavier"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/xavier/)
  end
end
