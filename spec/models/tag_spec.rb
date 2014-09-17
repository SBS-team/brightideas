require 'spec_helper'

describe Tag do
  context 'Tag db columns' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  describe 'validates' do
    before(:each) do
      FactoryGirl.create(:office)
      FactoryGirl.create(:developer)
      FactoryGirl.create(:user)
      @tag = FactoryGirl.create(:tag)
    end

    it 'is valid with valid attr' do
      @tag.should be_valid
    end

    it 'is not valid without user' do
      @tag.user_id = nil
      @tag.should_not be_valid
    end

    it 'is not valid without name' do
      @tag.name = nil
      @tag.should_not be_valid
    end

  end

  context 'associations' do
    it 'belong to to user' do
      should belong_to(:user)
    end
  end
end