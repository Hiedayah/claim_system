class ChangeCompanyType < ActiveRecord::Migration[5.2]
  def change
  	change_column :staffs, :company, :integer
  end
end
