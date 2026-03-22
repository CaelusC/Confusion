class CreateSprints < ActiveRecord::Migration[8.1]
  def change
    create_table :sprints do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :color
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
