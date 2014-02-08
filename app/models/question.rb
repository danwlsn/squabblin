class Question < ActiveRecord::Base

	has_many :arguments

	def self.random
		offset = rand(count)
		first(:offset => offset)
	end

end
