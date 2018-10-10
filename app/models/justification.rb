class Justification < ApplicationRecord
	belongs_to :claim
	before_update :place_timestamp

	def any_msg?
		msg = false
		Justification.peers.each do |role|
			if send(role) != nil && send(role).length >1
				msg = true
			end
		end
		msg
	end

	def sorted_justification
		justification_arr = []
		Justification.peers.each do |peer|
			if self.send(peer).present?
				regex = (self.send(peer) =~ /Time/i)
				if regex
					justification_arr << [self.send(peer)[regex+6..-1], peer]

				else
					justification_arr << [self.send(peer), peer]
				end

			end
		end
		justification_arr.sort{|x, y| DateTime.parse(y[0]) <=> DateTime.parse(x[0])}
	end

	def self.peers
		[:staff_message, :approver_message, :verifier_message]
	end

	def place_timestamp
		self.changed.each do |change|
			temp = self.remove_time(change)
			temp = "#{temp} Time: #{Time.now.strftime('%d/%m/%Y %H:%M')}".html_safe
			if self.send(change).present?
				self.send("#{change}=", temp)
			end
		end
	end

	def remove_time(method)
		temp = self.send(method)
		regex = (temp =~ /Time:/)
		if regex && regex > 0
			temp = self.send(method)[0..(regex-1)]
		end
		temp
	end
end
