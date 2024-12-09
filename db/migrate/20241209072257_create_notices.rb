class CreateNotices < ActiveRecord::Migration[8.0]
  def change
    create_table :notices do |t|
      t.string :image
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
