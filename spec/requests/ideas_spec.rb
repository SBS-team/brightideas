# require 'spec_helper'
#
# describe IdeasController do
#   before(:each) do
#     @user = FactoryGirl.create(:user)
#     sign_in(@user)
#   end
#
#   def sign_in(user)
#     visit new_user_session_path
#     fill_in "Email",    with: user.email
#     fill_in "Password", with: user.password
#     click_button "Sign in"
#   end
#
#   describe 'Index' do
#     it "should be success" do
#       response.should be_success
#     end
#
#     it "should be redirect" do
#       response.should_not be_redirect
#     end
#
#     it "has a 200 status code" do
#       expect(response.status).to eq(200)
#     end
#   end
#
# end