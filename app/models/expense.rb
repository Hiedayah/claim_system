class Expense < ApplicationRecord
	belongs_to :claim
	enum expense_type: [:travel, :food, :parking, :toll, :misc, :fixed_asset]
	mount_uploader :file, FileUploader

	def price
		case expense_type
			when "travel"
				Setting.v('travel_price').to_f * expense_value
			else
				expense_value
		end
	end
end
