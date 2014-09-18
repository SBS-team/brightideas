require 'spec_helper'

describe 'User controller', js: true do

  before(:all) do
    @user = FactoryGirl.create(:user, id: 512, email: 'test@mail.com')
    FactoryGirl.create(:office)
    FactoryGirl.create(:rank, name: 'developer')
  end

  def sign_in_user
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Sign in'
  end

  def sign_up_user
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Vasya'
    fill_in 'user_last_name',  with: 'Semenov'
    fill_in 'user_email', with: 'vasya@mail.com'
    fill_in 'user_password', with: '123123123'
    fill_in 'user_password_confirmation', with: '123123123'
    click_button 'Sign up'
  end

  def visit_user_profile
    sign_in_user
    find('.user-profile-link').click
  end

  describe 'user sign up' do
    it 'should successfully sign up user' do
      sign_up_user
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  describe 'user sign in' do
    it 'should login previously registered user' do
      sign_in_user
      expect(page).to have_content('Signed in successfully.')
    end
  end

  describe 'visit user profile' do
    it 'should visit user profile page' do
      visit_user_profile
      expect(page).to have_content('My ideas')
    end
  end

  describe 'user tags' do
    it 'should create user tag' do
      visit_user_profile
      find('.tags-input').set("tag1\ntag2\n")
      expect(@user.tags.count).to eq(2)
    end
  end

  describe 'change user profile photo' do
    it 'should change user profile photo' do
      visit_user_profile
      find('.change-avatar').click
      attach_file('user_avatar', "#{Rails.root}/app/assets/images/no_image_available_thumb.jpg")
      expect(page).to_not have_content('Файл не выбран')
      click_button 'Save changes'
    end
  end

  describe 'user sign out' do

    it 'should logout user' do
      sign_in_user
      find('.glyphicon-log-out').click
      expect(page).to have_content('Sign up')
    end
  end

  describe 'tag deleting' do
    it 'should remove user tag' do
      visit_user_profile
      first('.tag .remove').click
      expect(@user.tags.count).to eq(1)
    end
  end

end