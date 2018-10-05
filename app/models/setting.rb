class Setting < ApplicationRecord
	def self.v(description)
		Setting.find_by(description: description).value
	end
end
