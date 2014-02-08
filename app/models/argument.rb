class Argument < ActiveRecord::Base

	belongs_to :question
	has_many :comments

end
