class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :name, :string
    add_column :users, :age, :string
  end
end