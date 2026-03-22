class CreateTags < ActiveRecord::Migration[8.1]
  def change
    create_table :tags do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
