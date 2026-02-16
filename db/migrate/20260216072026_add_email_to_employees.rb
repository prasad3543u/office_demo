class AddEmailToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :email, :string
  end
end
