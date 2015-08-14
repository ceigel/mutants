require 'rails_helper'

RSpec.describe "mutants/show", type: :view do
  before(:each) do
    @mutant = assign(:mutant, Mutant.create!(
      :name => "Xavier",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Xavier/)
  end
end
