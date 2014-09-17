require 'spec_helper'

describe Rank do
  context 'Rank db columns' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  describe 'validates' do
    before(:each) do
      @rank = FactoryGirl.create(:developer)
    end

    it 'is valid with valid attr' do
      @rank.should be_valid
    end

    it 'is not valid without name' do
      @rank.name = nil
      @rank.should_not be_valid
    end

  end

  context 'associations' do
    it 'have many to user' do
      should have_many(:users)
    end
  end
end