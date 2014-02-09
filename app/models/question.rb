class Question < ActiveRecord::Base

	validates :title, presence: true

	has_many :arguments

	def self.random
		offset = rand(count)
		first(:offset => offset)
	end

end
