json.extract! staff, :id, :name, :email, :bank_account, :bank_name, :admin
if current_staff != staff
json.admin staff.admin? ? "#{link_to 'Set to Normal User', change_role_staff_record_path(staff, admin: 'false')}" : "#{link_to 'Set to Admin', change_role_staff_record_path(staff, admin: 'true')}"
else
json.admin ""
end