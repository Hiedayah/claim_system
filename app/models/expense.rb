class Expense < ApplicationRecord
	belongs_to :claim
	enum expense_type: [:travel_distance, :food, :parking, :toll, :misc, :fixed_asset]
	mount_uploader :file, FileUploader


	#before_save :expense

	def price
		Rails.logger.debug("PRICE ---------->")
		case expense_type
			when "travel_distance"
				(Setting.v('travel_price').to_f * expense_value).round(2) rescue 0.0
			else
				self.expense_value
		end
	end

end