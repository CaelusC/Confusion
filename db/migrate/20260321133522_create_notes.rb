class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.references :folder, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.json :content

      t.timestamps
    end
  end
end
