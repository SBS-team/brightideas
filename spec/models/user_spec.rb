require 'spec_helper'

describe User do
  context 'User db columns' do
    it { should have_db_column(:email).of_type(:string)}
    it { should have_db_column(:encrypted_password).of_type(:string)}
    it { should have_db_column(:reset_password_token).of_type(:string)}
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime)}
    it { should have_db_column(:remember_created_at).of_type(:datetime)}
    it { should have_db_column(:sign_in_count).of_type(:integer)}
    it { should have_db_column(:current_sign_in_at).of_type(:datetime)}
    it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:current_sign_in_ip).of_type(:string)}
    it { should have_db_column(:last_sign_in_ip).of_type(:string)}
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime)}
    it { should have_db_column(:first_name).of_type(:string)}
    it { should have_db_column(:last_name).of_type(:string)}
    it { should have_db_column(:office_id).of_type(:integer)}
    it { should have_db_column(:rank_id).of_type(:integer)}
  end
  describe 'validates' do
    before(:each) do
      FactoryGirl.create(:office)
      FactoryGirl.create(:developer)
      @user =  FactoryGirl.create(:user)
    end

    it 'is valid with valid attr' do
      @user.should be_valid
    end

    it 'is not valid without email' do
      @user.email = nil
      @user.should_not be_valid
    end

    it 'is not valid with wrong email' do
      @user.email = 'email'
      @user.should_not be_valid
    end

    it 'is not valid without office' do
      @user.office_id = nil
      @user.should_not be_valid
    end

    it 'is not valid without first name' do
      @user.first_name = nil
      @user.should_not be_valid
    end

    it 'is not valid without last_name' do
      @user.last_name = nil
      @user.should_not be_valid
    end

    it 'is not valid without rank' do
      @user.rank_id = nil
      @user.should_not be_valid
    end


  end

  context 'associations' do
    it 'belong to  rank' do
      should belong_to(:rank)
    end

    it 'belong to office' do
      should belong_to(:office)
    end

    it 'have many ideas' do
      should have_many(:ideas)
    end

    it 'have many comments' do
      should have_many(:comments)
    end

    it 'have many ratings' do
      should have_many(:ratings)
    end

    it 'have many tags' do
      should have_many(:tags)
    end

  end
end