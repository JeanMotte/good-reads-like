class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.references :author, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.date :published_date
      t.integer :number_of_pages

      t.timestamps
    end
  end
end
