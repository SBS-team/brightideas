require 'spec_helper'

describe Rating do
  context 'Rating db columns' do
    it { should have_db_column(:idea_id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:rate).of_type(:float) }
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  describe 'validates' do
    before(:each) do
      FactoryGirl.create(:office)
      FactoryGirl.create(:developer)
      FactoryGirl.create(:user)
      FactoryGirl.create(:idea)
      @rating = FactoryGirl.create(:rating)
    end

    it 'is valid with valid attr' do
      @rating.should be_valid
    end

    it 'is not valid without idea' do
      @rating.idea_id = nil
      @rating.should_not be_valid
    end

    it 'is not valid without user' do
      @rating.user_id = nil
      @rating.should_not be_valid
    end

    it 'is not valid without rate' do
      @rating.rate = nil
      @rating.should_not be_valid
    end

    it 'is not valid with rate<0' do
      @rating.rate = -1
      @rating.should_not be_valid
    end

    it 'is not valid with rate>5' do
      @rating.rate = 6.1
      @rating.should_not be_valid
    end

  end

  context 'associations' do
    it 'belong to to user' do
      should belong_to(:user)
    end
    it 'belong to to idea' do
      should belong_to(:idea)
    end
  end
end