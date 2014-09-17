class Office < ActiveRecord::Base
  has_many :users
  validates :number, presence: true
end
