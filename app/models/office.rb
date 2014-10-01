class Office < ActiveRecord::Base
  has_many :users
  validates :number, presence: true

  def display_name
    self.number.to_s()
  end

end
