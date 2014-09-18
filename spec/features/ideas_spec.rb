require 'spec_helper'

describe 'Idea controller', js: true do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @idea = FactoryGirl.create(:idea, id: 10)
  end

  def sign_in_user
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Sign in'
  end

  def visit_idea_page
    sign_in_user
    visit idea_path @idea
  end

  describe 'idea creation' do
    it 'should create idea' do
      sign_in_user
      click_link 'Create idea'
      expect(page).to have_content 'New idea'
      fill_in 'title', with: 'My idea'
      page.execute_script('$(CKEDITOR.instances.description.setData("this is ideas description"));')
      find('#post_idea').click
      expect(page).to have_content('Your comment')
    end
  end

  describe 'show idea page' do
    it 'should show idea page' do
      visit_idea_page
      expect(page).to have_content('Your comment')
    end
  end

  describe 'post comment' do
    it 'should crete comment to idea' do
      visit_idea_page
      page.execute_script('$(CKEDITOR.instances.comment_text.setData("this is idea comment"));')
      click_button 'Post comment'
      expect(page).to have_content('this is idea comment')
    end
  end

  after(:all) do
    @user.destroy()
    @idea.destroy()
  end

end