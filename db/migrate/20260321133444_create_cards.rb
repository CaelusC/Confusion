class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.references :project, null: false, foreign_key: true
      t.references :sprint, null: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :color
      t.string :priority
      t.string :card_type
      t.string :status

      t.timestamps
    end
  end
end
