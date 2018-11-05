class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :info
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
