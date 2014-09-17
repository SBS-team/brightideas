require 'factory_girl'

FactoryGirl.define do
  factory :attachment do
    id 73
    path File.open(File.join(Rails.root, '/app/assets/images/file.gif'))
    idea_id 1
  end
end