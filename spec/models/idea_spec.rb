require 'spec_helper'

describe Idea do
  context 'Idea db columns' do
    it { should have_db_column(:user_id).of_type(:integer)}
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text)}
    it { should have_db_column(:avatar_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  describe 'validates' do
    before(:each) do
      FactoryGirl.create(:office)
      FactoryGirl.create(:developer)
      FactoryGirl.create(:user)
      @idea = FactoryGirl.create(:idea)
      FactoryGirl.create(:comment)
    end

    it 'is valid with valid attr' do
      @idea.should be_valid
    end

    it 'is not valid without title' do
      @idea.title = nil
      @idea.should_not be_valid
    end

    it 'is not valid without body' do
      @idea.description = nil
      @idea.should_not be_valid
    end

    it 'is not be valid without user' do
      @idea.user_id = nil
      @idea.should_not be_valid
    end

    it 'rate must be 0 by default' do
      @idea = FactoryGirl.create(:idea_without_rate)
      @idea.rate.should == 0.0
    end

    it 'comment_count must be 1' do
      @idea.reload
      @idea.comments_count.should == 1
    end
  end

  context 'associations' do
    it 'should have many comments' do
      should have_many(:comments)
    end

    it 'should have many attachments' do
      should have_many(:attachments)
    end

    it 'should belongs to user' do
      should belong_to(:user)
    end
  end
end