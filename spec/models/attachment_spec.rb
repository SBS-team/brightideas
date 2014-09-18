require 'spec_helper'

describe Attachment do
  context 'Attachment db columns' do
    it { should have_db_column(:idea_id).of_type(:integer)}
    it { should have_db_column(:path).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime)}
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end
  describe 'validates' do
    before(:each) do
      FactoryGirl.create(:office)
      FactoryGirl.create(:developer)
      FactoryGirl.create(:user)
      FactoryGirl.create(:idea)
      @attachment = FactoryGirl.create(:attachment)
    end

    it 'is valid with valid attr' do
      @attachment.should be_valid
    end

  end

  context 'associations' do
    it 'should belongs to user' do
      should belong_to(:idea)
    end
  end
end