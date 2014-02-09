class Comment < ActiveRecord::Base

	validates :comment, presence: true, length: { maximum: 300 }

	belongs_to :argument

end
