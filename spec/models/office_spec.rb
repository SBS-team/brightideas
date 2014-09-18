require 'spec_helper'

describe Office do
  context 'Office db columns' do
    it { should have_db_column(:number).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  describe 'validates' do
    before(:each) do
      @office = FactoryGirl.create(:office)
    end

    it 'is valid with valid attr' do
      @office.should be_valid
    end

    it 'is not valid without number' do
      @office.number = nil
      @office.should_not be_valid
    end

  end

  context 'associations' do
    it 'have many to user' do
      should have_many(:users)
    end
  end
end