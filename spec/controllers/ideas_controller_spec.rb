#require 'rails_helper'
#
#describe IdeasController, :type => :controller  do
#
#  let(:office){FactoryGirl.create(:office)}
#  let(:rank)  {FactoryGirl.create(:developer)}
#  let(:user)  {FactoryGirl.create(:user, office_id: office.id, rank_id: rank.id)}
#  let(:idea)  {FactoryGirl.create(:idea, user_id: user.id)}
#
#  describe 'GET #index' do
#
#    it 'has route for ideas list' do
#      {get: ideas_path}.should route_to(controller: 'ideas', action: 'index')
#    end
#
#    it 'has route for new idea' do
#      {get: new_idea_path}.should route_to(controller: 'ideas', action: 'new')
#    end
#
#    it 'has route for show idea' do
#    {get: '/ideas/1'}.should route_to('ideas#show', id: '1')
#    end
#
#    it 'check ideas count decrease after removing' do
#      expect { delete :destroy, id: idea.id }.to change(Idea, :count).by(1)
#    end
#
#  end
#
#end