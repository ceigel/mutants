require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) {FactoryGirl.create(:team)}
  subject { team }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to :name }

  it 'is valid when built from parameters' do
    m = FactoryGirl.build(:team)
    expect(m).to be_valid
    expect(m.save).to eq true
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:team, name: nil)).not_to be_valid
  end

  it 'is invalid with duplicated name' do
    expect(FactoryGirl.build(:team, name: team.name)).not_to be_valid
  end
end
