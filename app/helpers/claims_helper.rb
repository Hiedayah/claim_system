module ClaimsHelper
	def file_link(expense)
		if expense.file_url
			link_to expense.file_url, target: '_blank' do 
				fa_icon "file"
			end
		else
			""
		end
	end
end
