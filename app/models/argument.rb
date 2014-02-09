class Argument < ActiveRecord::Base

	validates :text, presence: true, length: { maximum: 300 }

	belongs_to :question
	has_many :comments

end
