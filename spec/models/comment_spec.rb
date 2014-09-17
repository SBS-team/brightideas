require 'spec_helper'

describe Comment do
  context 'Comment db columns' do
    it { should have_db_column(:user_id).of_type(:integer)}
    it { should have_db_column(:text).of_type(:text) }
    it { should have_db_column(:parent_id).of_type(:integer)}
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  context 'validates' do
    before(:each) do
      FactoryGirl.create(:office)
      FactoryGirl.create(:developer)
      FactoryGirl.create(:user)
      FactoryGirl.create(:idea)
      @comment = FactoryGirl.create(:comment)
    end

    it 'is valid with valid attr' do
      @comment.should be_valid
    end

    it 'is not valid without text' do
      @comment.text = nil
      @comment.should_not be_valid
    end

    it 'is not be valid without user' do
      @comment.user_id = nil
      @comment.should_not be_valid
    end

    it 'is not be valid without idea' do
      @comment.idea_id = nil
      @comment.should_not be_valid
    end
  end

  context 'associations' do

    it 'should belongs to user' do
      should belong_to(:user)
    end

    it 'should belongs to idea' do
      should belong_to(:idea)
    end

  end
end