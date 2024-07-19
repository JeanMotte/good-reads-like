class AddFieldsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :description, :string
    add_column :books, :photo, :string
    add_column :books, :publisher, :string
  end
end
