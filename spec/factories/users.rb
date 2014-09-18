require 'factory_girl'

FactoryGirl.define do
  factory :user do |u|
    u.id 1
    u.first_name 'Sergey'
    u.last_name 'Ivanov'
    u.email 'sergey_ivanov@mail.com'
    u.office_num '1'
    u.rank_id 1
    u.password '123123123'
  end
end