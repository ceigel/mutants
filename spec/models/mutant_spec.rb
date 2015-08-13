require 'rails_helper'

RSpec.describe Mutant, type: :model do
  let(:mutant) {FactoryGirl.create(:mutant)}
  subject { mutant }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :capability }

  it 'is valid when built from parameters' do
    m = FactoryGirl.build(:mutant)
    expect(m).to be_valid
    expect(m.save).to eq true
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:mutant, name: nil)).not_to be_valid
  end

  it 'is valid without a capability' do
    expect(FactoryGirl.build(:mutant, capability: nil)).to be_valid
  end

  it 'is invalid with duplicated name' do
    expect(FactoryGirl.build(:mutant, name: mutant.name)).not_to be_valid
  end

end
