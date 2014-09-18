require 'factory_girl'

FactoryGirl.define do
  factory :tag do |item|
    item.sequence(:id)
    item.sequence(:name) {|n| "tag#{n}"}
    item.user_id 1
  end

end