class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    self.email && ENV['ADMIN_EMAILS'].to_s.include?(self.email)
  end

  has_many   :ideas
  has_many   :comments
  belongs_to :rank

end