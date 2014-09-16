class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    self.email.eql?(ENV['ADMIN_EMAILS'].to_s)
  end

  has_many   :ideas, dependent: :destroy
  has_many   :tags, dependent: :destroy
  has_many   :comments, dependent: :destroy
  belongs_to :rank
  has_many   :ratings, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def last_activity(format = nil)
    activity = []
    activity << self.ideas.last
    activity << self.comments.last

    last_activity = activity.compact.sort_by do |obj|
      obj.updated_at
    end.last.try(:updated_at)

    last_activity ||= self.updated_at

    if format == :db
      last_activity.getlocal.to_s(:db)
    end

    last_activity
  end

end