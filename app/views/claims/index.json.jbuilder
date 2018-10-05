json.set! :data do
	json.array! @claims, partial: 'claims/claim', as: :claim
end