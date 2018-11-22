class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :reason
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.timestamps
    end
  end
end
