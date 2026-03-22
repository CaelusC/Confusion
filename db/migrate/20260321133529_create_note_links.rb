class CreateNoteLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :note_links do |t|
      t.references :source_note, null: false, foreign_key: { to_table: :notes }
      t.references :target_note, null: false, foreign_key: { to_table: :notes }

      t.timestamps
    end
  end
end
