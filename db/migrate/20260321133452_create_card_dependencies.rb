class CreateCardDependencies < ActiveRecord::Migration[8.1]
  def change
    create_table :card_dependencies do |t|
      t.references :blocking_card, null: false, foreign_key: { to_table: :cards }
      t.references :blocked_card, null: false, foreign_key: { to_table: :cards }

      t.timestamps
    end
  end
end
