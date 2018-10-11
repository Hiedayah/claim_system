json.set! :data do
	json.array! @settings, partial: 'settings/setting', as: :setting
end