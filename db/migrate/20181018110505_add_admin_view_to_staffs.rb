class AddAdminViewToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :admin_view, :boolean
  end
end
