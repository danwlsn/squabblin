class Question < ActiveRecord::Base

	validates :title, presence: true
	validates :args_a, presence: true
	validates :args_b, presence: true

	has_many :arguments

	def self.random
		offset = rand(count)
		first(:offset => offset)
	end

end
