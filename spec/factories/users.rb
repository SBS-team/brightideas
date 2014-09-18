require 'factory_girl'

FactoryGirl.define do
  factory :user do |u|
    u.id 1
    u.first_name 'Sergey'
    u.last_name 'Ivanov'
    u.email 'ivanov@mail.com'
    u.office_id  1
    u.rank_id 1
    u.password '123123123'
    u.password_confirmation '123123123'
    u.avatar File.open(File.join(Rails.root, '/app/assets/images/file.gif'))
  end
end