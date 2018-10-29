class Setting < ApplicationRecord
  validates_presence_of :value
	def self.v(description)
		Setting.find_by(description: description).value
	end
end
