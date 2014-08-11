class Attachment < ActiveRecord::Base
	belongs_to :idea
	belongs_to :comment
end
