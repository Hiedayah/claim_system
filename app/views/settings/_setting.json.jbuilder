json.extract! setting, :id, :description, :value, :created_at, :updated_at
json.url "#{url_button(edit: {url: edit_setting_path(id: setting.id)})}"

